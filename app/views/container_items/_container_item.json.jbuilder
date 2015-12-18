json.id container_item.id
json.itemable_type container_item.itemable_type.downcase
json.itemable_id container_item.itemable_id
json.itemable_name container_item.itemable.name

if container_item.itemable.is_a?(Recipe)
  json.desc container_item.itemable.keywords.join(', ').truncate(25)
elsif container_item.itemable.is_a?(Container)
  json.desc "#{container_item.itemable.container_items.count} items"
end
