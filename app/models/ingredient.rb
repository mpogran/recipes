class Ingredient
  include ActiveModel::Model
  include ActiveModel::Serializers::JSON

  # Attributes
  attr_accessor :name, :category, :quantity, :description

  # Validations
  validates :name, :description, presence: true

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def attributes
    {
      "name" => name,
      "category" => category,
      "description" => description,
      "quantity" => quantity
    }
  end

  def self.parse(str)
    # TODO intelligent parse
  end

end
