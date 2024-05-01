class User < ApplicationRecord
  has_secure_password

  has_one :teacher
  has_one :student

  validates :email, :password_digest, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :role,
            inclusion: { in: %w[admin user director teacher student staff],
                         message: '%<value>s is not a valid role [admin, user, director, teacher. student, staff]' }
end
