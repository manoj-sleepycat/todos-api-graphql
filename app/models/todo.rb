class Todo < ApplicationRecord

  validates_presence_of :title, :created_by

  validates :created_by, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  has_many :items, dependent: :destroy
end
