module ApplicationHelper
  def flash_class(level)
    case level.to_sym
      when :notice then
        "success"
      when :info then
        "notice"
      when :alert then
        "error"
      when :warning then
        "warning"
    end
  end

  def error_messages! resource
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
