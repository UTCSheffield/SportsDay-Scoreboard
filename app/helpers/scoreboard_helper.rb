module ScoreboardHelper
  def render_scoreboard_rows(year)
    events = Event.all.where(year: year)
    header = content_tag(:th, "Year #{year}")
    turing = content_tag(:td, "#{events.sum(:turing)}", id: "#{year}-turing")
    winston = content_tag(:td, "#{events.sum(:winston)}", id: "#{year}-winston")
    sharman = content_tag(:td, "#{events.sum(:sharman)}", id: "#{year}-sharman")
    ennis = content_tag(:td, "#{events.sum(:ennis)}", id: "#{year}-ennis")
    content_tag(:tr,
      [header, turing, winston, sharman, ennis].join.html_safe
    )
  end
end
