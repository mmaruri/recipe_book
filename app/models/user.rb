class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest, :password, :password_confirmation, :role

  has_secure_password

  has_many :recipes
  belongs_to :user

  validates :first_name, :presence => true, :length => {:maximum => 32}
  validates :last_name, :presence => true, :length => {:maximum => 32}
  validates :email, :presence => true, :length => {:maximum => 64}, :uniqueness => true
  validates :password, :presence => true
  validates :password_confirmation, :presence => true, :on => :create
  validates :role, :presence => true

  ADMIN_ROLE = 'admin'
  USER_ROLE = 'user'
  ROLE_OPTIONS = [ADMIN_ROLE, USER_ROLE]

end
