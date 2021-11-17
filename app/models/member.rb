class Member < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_paper_trail
  has_person_name

  validates_presence_of :first_name, :last_name

  validates :email, email: true, uniqueness: { case_sensitive: false }

  def generate_jwt
    JWT.encode({ id: id, exp: 60.days.from_now.to_i }, ENV['SECRET_KEY_BASE'])
  end
end
