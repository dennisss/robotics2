class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
  attr_accessible :text, :title
	validates :title, presence: true,
										length: { minimum: 5 }
end
