class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :user_id
	validates :body, presence: true
end
