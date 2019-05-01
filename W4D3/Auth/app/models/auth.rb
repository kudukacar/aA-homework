class Auth < ApplicationRecord
    validates :username, :session_token, presence: true 
    validates :password_digest, presence: true

    def self.find_by_credentials(username, password)
        user = Auth.find_by(username:params[:username])
        return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
        nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        self.session_token = Auth.generate_session_token
        self.save!
        self.session_token 

    end

    def ensure_session_token
        self.session_token ||= Auth.generate_session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
end