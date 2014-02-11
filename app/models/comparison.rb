class Comparison < ActiveRecord::Base
	belongs_to :user

	has_many :favorite_comparisons
	has_many :favorited_by, through: :favorite_comparisons, source: :user

end
