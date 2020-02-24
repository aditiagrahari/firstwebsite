class User < ApplicationRecord
  #attr_accessor :password, :password_confirmation
  # validates_confirmation_of :password
  # validates_presence_of :password_confirmation, if: :password_changed?
  # has_secure_password
  def authenticate(session_password)
    self.password == session_password
  end
end
