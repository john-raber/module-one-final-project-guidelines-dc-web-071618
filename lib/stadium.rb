class Stadium < ActiveRecord::Base
    belongs_to :team 
    has_many :matches
    has_many :teams, through: :matches 
end