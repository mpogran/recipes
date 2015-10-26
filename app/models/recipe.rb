class Recipe < ActiveRecord::Base

  # Associations
  belongs_to :user

  # Validations
  validates :name, :user, presence: true

  # Callbacks
  after_initialize :initialize_ingredients

  def set_location(type, hash)
    keys = case type
    when :website
      [:url]
    when :book
      [:edition, :page]
    when :magazine
      [:issue, :page]
    end

    if keys.all? {|k| hash.key?(k)}
      self.location = {type: type.to_s, location: hash }
    else
      raise ArgumentError.new('Invalid location for type.')
    end
  end

  private
  def initialize_ingredients
    self.ingredients ||= []
  end

  def location
    super
  end

  def location=(val)
    super(val)
  end

end
