class User < ApplicationRecord
  belongs_to :role
  has_secure_password validations: false

  def password=(new_password)
    self.password_hash = BCrypt::Password.create(new_password)
  end

  def authenticate(password)
    BCrypt::Password.new(password_hash) == password
  end

end
