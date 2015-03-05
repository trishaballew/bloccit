class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user_id
  belongs_to :index 

  validates :body, length: { minimum: 5 }, presence: true
  validates :user_id, presence: true
end
