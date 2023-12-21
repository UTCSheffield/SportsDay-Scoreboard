module ScoreboardHelper
  def render_scoreboard_rows(year)
    events = Event.all.where(year: year)
    header = content_tag(:th, "Year #{year}")
    turing = content_tag(:td, "#{events.sum(:turing)}", id: "#{year}-turing", class: "turing")
    winston = content_tag(:td, "#{events.sum(:winston)}", id: "#{year}-winston", class: "winston")
    sharman = content_tag(:td, "#{events.sum(:sharman)}", id: "#{year}-sharman", class: "sharman")
    ennis = content_tag(:td, "#{events.sum(:ennis)}", id: "#{year}-ennis", class: "ennis")
    total = content_tag(:td, "#{events.sum(:turing) + events.sum(:winston) + events.sum(:sharman) + events.sum(:ennis)}")
    content_tag(:tr,
      [header, winston, ennis, sharman, turing, total].join.html_safe
    )
  end
  def render_column_totals
    events = Event.all
    header = content_tag(:th, "Totals")
    turing = content_tag(:td, "#{events.sum(:turing)}", class: "turing")
    winston = content_tag(:td, "#{events.sum(:winston)}", class: "winston")
    sharman = content_tag(:td, "#{events.sum(:sharman)}", class: "sharman")
    ennis = content_tag(:td, "#{events.sum(:ennis)}", class: "ennis")
    blank = content_tag(:td, content_tag(:a, content_tag(:p, " ", class:"linkgon"), href:"http://aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.com/#AAaAaaaAAAaAaaAAAaAaaAAAaaaaAAAaaAAaAAAaAaaAaAAAAaAaAAAAAAAaAAAAAAaAAAAAAaAAAaAaAAAaAAAAaaAAAaAAAAAAAaAaAAAAaAaaAAAaAaAAAaaaAaAAaaAaAaAaAAAaAAaaaAAAAaAAAAAAaAAaAaAaAAAAAAAaAAAAAaaaaAAAAaAaaAAaaaAAAAaAaaaaAAAAAAAAAaAAaaAAAAaAAAaaAaaAaAaaaAAAAaAAAaAAaAaaAAAaAAAaAAAaaAAaAaAAAAAaaAAAAaAAaaaAAaaaAAAaAaaaA", class: "linkgon"), class:"linkgon")
    content_tag(:tr,
      [header, winston, ennis, sharman, turing, blank].join.html_safe
    )
  end
end
