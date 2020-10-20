class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email, :case_sensitive => false 
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validate :confirm_password
  before_save :downcase_email

  def downcase_email
     self.email.downcase!
  end

  def confirm_password
    if password != password_confirmation
      errors.add(:password_confirmation, "must equal the inputed password")
    end
  end
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.split(" ")[0].downcase)
    if user.authenticate(password)
      user
    else
      nil
    end
  end
end
