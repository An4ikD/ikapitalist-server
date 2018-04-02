class User < ApplicationRecord
  has_secure_password

  def is_guest?
    self.role == Rails.configuration.USER_ROLES.index('guest')
  end

  def is_investor?
    self.role == Rails.configuration.USER_ROLES.index('investor')
  end

  def is_approved_investor?
    self.role == Rails.configuration.USER_ROLES.index('approved investor')
  end

  def is_businessman?
    self.role == Rails.configuration.USER_ROLES.index('businessman')
  end

end
