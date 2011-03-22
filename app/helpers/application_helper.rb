module ApplicationHelper
  def flash_helper
    fl = ""
    flash.each do |key, value|
			fl += content_tag(:div, value, :class => "flash #{key}")
		end
		return fl.html_safe
	end
end