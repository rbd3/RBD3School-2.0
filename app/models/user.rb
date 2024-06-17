class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :teacher, dependent: :destroy
  has_one :student, dependent: :destroy

  validates :password, presence: true, confirmation: true, length: { minimum: 8 }

  validates :first_name, presence: true
  validates :role,
            inclusion: { in: %w[admin user director teacher student staff],
                         message: '%<value>s is not a valid role' },
                         allow_nil: true
end
