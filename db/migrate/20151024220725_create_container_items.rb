class CreateContainerItems < ActiveRecord::Migration
  def change
    create_table :container_items do |t|
      t.references :container
      t.references :itemable, polymorphic: true
    end
  end
end
