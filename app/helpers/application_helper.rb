module ApplicationHelper

  def action_id
    id = case (controller.controller_name + controller.action_name)
    when 'sessionsnew'
      'login'
    end

    return "id=#{id}" unless id.blank?
  end
end
