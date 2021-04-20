class Article < ApplicationRecord
  include AASM

  has_many :comments, dependent: :destroy
  belongs_to :user

  # Active storage configuration
  has_many_attached :attachments

  aasm column: :state do # default column: aasm_state
    state :draft, initial: true
    state :submit, :publish

    event :submitting do
      transitions from: :draft, to: :submit
    end

    event :publishing do
      transitions from: :submit, to: :publish
    end
  end
end
