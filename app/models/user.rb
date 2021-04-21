class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_ancestry ancestry_column: :manager_id

  has_many :articles, dependent: :destroy

  enum role: { admin: "admin", user: "user" }
end
