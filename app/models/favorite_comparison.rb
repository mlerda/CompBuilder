class FavoriteComparison < ActiveRecord::Base
	belongs_to :company
	belongs_to :comparison
	belongs_to :user

	has_many :favorites, through: :favorite_comparisons, source: :user
end
