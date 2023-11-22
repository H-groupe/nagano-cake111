module ApplicationHelper
  def display_errors(resource, *attribute_names)
    messages = attribute_names.map { |attribute| resource.errors[attribute] }.flatten
    messages.join(", ").html_safe if messages.any?
  end
end
