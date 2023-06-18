module ApplicationHelper
  def full_name(model)
    "#{model.first_name} #{model.last_name}"
  end
end
