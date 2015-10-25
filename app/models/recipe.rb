class Recipe < ActiveRecord::Base

  # Associations
  belongs_to :user, foreign_key: 'owner_id'
  has_many :ingredients do

  end

  # Validations
  validates :name, :owner, presence: true

  # Callbacks
  after_initialize :initialize_ingredient_list
  before_save :set_ingredients

  def ingredients
    @ingredient_list
  end

  def ingredients=(ingredients)
    @ingredient_list = ingredients
  end

  private
  def initialize_ingredient_list
    @ingredient_list = self[:ingredients] || []
  end

  def set_ingredients
    self[:ingredients] = @ingredient_list.map { |i| i.as_json }
  end

end
