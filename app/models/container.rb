class Container < ActiveRecord::Base

  # Associations
  belongs_to :user
  has_many :container_items, dependent: :destroy
  has_many :recipes, through: :container_items, source: :itemable, source_type: 'Recipe'
  has_many :containers, through: :container_items, source: :itemable, source_type: 'Container'

  # Validations
  validates :name, presence: true

  def add_item(item)
    if item.is_a?(Recipe)
      recipes << item
      return true
    elsif item.is_a?(Container)
      containers << item
      return true
    end
    false
  rescue ActiveRecord::RecordInvalid
    false
  end

end
