class Micropost < ApplicationRecord
	belongs_to :user
	validataes :content, length: { maximum: 140 }, presence: true
end
