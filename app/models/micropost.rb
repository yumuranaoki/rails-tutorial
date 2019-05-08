class Micropost < ApplicationRecord
	belongs_to :user
	validataes :content, length: { maximum: 120 }, presence: true
end
