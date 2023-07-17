class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :assign_default_role
  

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
  
end

