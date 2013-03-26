class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :directions, :name, :user_id

  has_many :ingredients
  belongs_to :user
  belongs_to :category

  validates :name, :presence => true, :uniqueness => true, :length => {:maximum => 64}
  validates :category_id, :presence => true
  validates :directions, :presence => true
  validates :user_id, :presence => true

end
