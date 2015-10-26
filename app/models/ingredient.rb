class Ingredient
  include ActiveModel::Model
  include ActiveModel::Serializers::JSON

  # Attributes
  attr_accessor :name, :category, :quantity, :modifier, :description

  # Validations
  validates :name, presence: true

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

  def attributes
    {
      "name" => name,
      "category" => category,
      "quantity" => quantity,
      "modifier" => modifier,
      "description" => description,
    }
  end

  def self.parse(str)
    # TODO intelligent parse
  end

end
