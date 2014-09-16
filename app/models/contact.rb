class Contact < ActiveRecord::Base
  has_many :addresses

  validates :name, :email, presence: true
end
