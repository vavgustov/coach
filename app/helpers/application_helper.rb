module ApplicationHelper
  def render_notifications
    notifications = []
    flash.each do |key, value|
      css_class = case key
                  when 'alert'
                    'is-danger'
                  when 'notice'
                    'is-warning'
                  when 'error'
                    'is-danger'
                  when 'success'
                    'is-success'
                  else
                    'is-info'
                  end
      notifications << content_tag(:div, value.html_safe, class: "notification #{css_class}")
    end
    notifications.join('').html_safe
  end

  def is_active_page(path)
    current_page?(path) ? 'is-active' : ''
  end
end
