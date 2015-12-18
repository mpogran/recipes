class Recipe < ActiveRecord::Base

  # Associations
  belongs_to :user
  has_many :container_items, as: :itemable, dependent: :destroy

  # Validations
  validates :name, :user, presence: true

  # Callbacks
  after_initialize :initialize_ingredients

  def keywords=(val)
    if val.is_a?(String)
      val = val.split(', ')
    end

    if val.is_a?(Array)
      super(val)
    else
      raise ArgumentError.new('Invalid value. Keywords must be an Array.')
    end
  end

  def set_location(type, hash)
    keys = case type
    when :website
      [:url]
    when :book
      [:edition, :page]
    when :magazine
      [:issue, :page]
    when :other
      [:value]
    end

    if keys.all? {|k| hash.key?(k)}
      self.location = {type: type.to_s, location: hash }
      self.save
    else
      raise ArgumentError.new('Invalid location for provided type.')
    end
  end

  private
  def initialize_ingredients
    self.ingredients ||= []
  end

  def location=(val)
    super(val)
  end

end
