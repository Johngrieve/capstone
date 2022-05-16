class Account < ApplicationRecord
  belongs_to :user

  # validates :name, presence :true
  # validates :character, presence :true
  # validates :role, presence :true
  # validates :rank, presence :true
end
