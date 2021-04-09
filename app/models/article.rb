class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 4 }
  validates :body, presence: true, length: { minimum: 4 }

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment
end
