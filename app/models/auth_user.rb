require 'digest/sha2'

class AuthUser < ActiveRecord::Base

  validates :user_name, :presence => true, :uniqueness => true
  validates :user_password, :confirmation => true
  attr_accessor :user_password_confirmation
  attr_reader :user_password
  validate :user_password_must_be_present

  def user_password=(password) # virtual attribute
    @user_password = password
    if password.present?
      make_pass_salt
      self.enc_pass = self.class.make_enc_pass(password, pass_salt)
    end
  end

  def self.authenticate(name, password)
    if user = find_by_user_name(name)
      if user.enc_pass == make_enc_pass(password, user.pass_salt)
        user
      end
    end
  end

  def self.make_enc_pass(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end

  private

    def user_password_must_be_present
      errors.add(:user_password, "Missing password") unless enc_pass.present?
    end

    def make_pass_salt
      self.pass_salt = self.object_id.to_s + rand.to_s
    end
end
