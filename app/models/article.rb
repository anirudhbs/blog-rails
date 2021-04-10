class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 4 }
  validates :body, presence: true, length: { minimum: 4 }

  # Active storage configuration
  has_many_attached :attachments
end
