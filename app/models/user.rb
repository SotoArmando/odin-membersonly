class User < ApplicationRecord
    attr_accessor  :remember_token
    before_create :create_remember_token
    has_many :posts
    has_secure_password
    def User.new_token
     SecureRandom::urlsafe_base64
    end
 
    def User.digest(string)
         cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                       BCrypt::Engine.cost
         BCrypt::Password.create(string, cost:cost)
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def delete_remember_token
        update_attribute(:remember_digest, nil)
    end

    private
    def create_remember_token
        self.remember_token = User.new_token
        self.remember_digest = User.digest(remember_token)
    end


end





