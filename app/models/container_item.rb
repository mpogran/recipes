class ContainerItem < ActiveRecord::Base

  # Associations
  belongs_to :container
  belongs_to :itemable, polymorphic: true

  # Validations
  validate :check_circular

  private
  def check_circular
    if container == itemable
      errors.add(:itemable, 'cannot build circular relationship')
    end
  end
end
