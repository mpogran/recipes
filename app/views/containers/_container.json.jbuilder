json.id container.id
json.name container.name
json.items container.container_items, partial: 'container_items/container_item', as: :container_item
#json.items collection: , partial: 'container_items/container_item', as: :container_item
