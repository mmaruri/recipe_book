class Ingredient < ActiveRecord::Base
  attr_accessible :name, :quantity, :recipe_id, :unit

  belongs_to :recipe

  validates :name, :presence => true, :uniqueness => true, :length => {:maximum => 128}
  validates :quantity, :presence => true
  validates :unit, :presence => true, :length => {:maximum => 32}
  validates :recipe_id, :presence => true

end
