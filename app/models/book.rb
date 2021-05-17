class Book < ApplicationRecord
  belongs_to :user

  ### Validations ###
  validates :user, presence: true
  validates :author_name, presence: true
  validates :name, presence: true
end
