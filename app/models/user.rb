class User < ApplicationRecord
  validates :first_name, presence: true
  validates :role,
            inclusion: { in: %w[admin user director teacher], message: '%<value>s is not a valid role [admin, user]' }
end
