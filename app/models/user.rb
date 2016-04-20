class User < ActiveRecord::Base
  has_secure_password

  enum role: [:admin, :user, :guest]

  include UserRole

  after_initialize :set_default_role, if: :new_record?

  has_many :posts
  has_many :comments

  validates :password, presence: true
  validates :email, presence: true, uniqueness: true

  def self.confirm(email_params, password_params)
    user = User.find_by(email: email_params)
    user.authenticate(password_params)
  end

  def set_default_role
    self.role ||= :user
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
