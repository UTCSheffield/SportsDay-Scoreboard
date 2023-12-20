module ScoreboardHelper
  def render_scoreboard_rows(year)
    events = Event.all.where(year: year)
    header = content_tag(:th, "Year #{year}")
    turing = content_tag(:td, "#{events.sum(:turing)}", id: "#{year}-turing", class: "turing")
    winston = content_tag(:td, "#{events.sum(:winston)}", id: "#{year}-winston", class: "winston")
    sharman = content_tag(:td, "#{events.sum(:sharman)}", id: "#{year}-sharman", class: "sharman")
    ennis = content_tag(:td, "#{events.sum(:ennis)}", id: "#{year}-ennis", class: "ennis")
    content_tag(:tr,
      [header, winston, ennis, sharman, turing].join.html_safe
    )
  end
end
