module ApplicationHelper
  def action_helper(version)
    output = ""
    case version.action.blank? ? "" : version.action.to_sym
    when :create
      output += content_tag(:b, "Created")
    when :update
      output += content_tag(:b, content_tag(:u, "Modifications:"))
      output += tag("br")
      output += render :partial => "shared/version_actions", :locals => {:version => version}
    when :revert
      output += content_tag(:b, "Reverted to version ") + content_tag(:u, "#{version.reverted_from}")
    else
      output += "Unknown"
    end
    output.html_safe
  end
end