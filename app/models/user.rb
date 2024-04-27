class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :role,
            inclusion: { in: %w[admin user director teacher],
                         message: '%<value>s is not a valid role [admin, user, director, teacher]' }
end
