Haml::Helpers.class_eval do
  def ng_exp(angular)
    formatted = {}
    angular.each do |k, v|
      f_key = :"#{k.to_s.gsub('_', '-')}"
      formatted[f_key] = v
    end
    return formatted
  end

  def view(name)
    return {:'ui-view' => name}
  end
end
