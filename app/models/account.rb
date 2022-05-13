class Account < ApplicationRecord
  belongs_to :user

  validates :name, presence :true, :character, presence :true, :role, presence :true, :rank, presence :true
end
