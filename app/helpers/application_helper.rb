module ApplicationHelper

  def ga_track_event(category, action, label)
    if Rails.env.production?
      category = escape_javascript(category)
      action = escape_javascript(action)
      label = escape_javascript(label)

      raw("_gaq.push(['_trackEvent', '#{category}', '#{action}', '#{label}']);")
    end
  end

end
