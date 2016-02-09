module ApplicationHelper
  def resource_name
   :user
 end

 def resource
   @resource ||= User.new
 end

 def devise_mapping
   @devise_mapping ||= Devise.mappings[:user]
 end

  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end
end
