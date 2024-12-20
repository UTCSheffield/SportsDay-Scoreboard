class ScoreboardController < ApplicationController
  before_action :allow_iframe_requests

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end

  def index
    year_totals = Event
      .select("year, SUM(turing) AS turing, SUM(winston) AS winston, SUM(sharman) AS sharman, SUM(ennis) AS ennis")
      .group(:year)

    # Calculate the leading year groups
    highest_year_score = year_totals.map { |result| total_score(result) }.max || 0
    leading_years = year_totals.select { |result| total_score(result) == highest_year_score }
    @leading_year = highest_year_score.positive? ? 
    "Lead Year#{leading_years.size > 1 ? 's' : ''}: " + 
    leading_years.map(&:year).join(", ") : 
    "Lead Year: N/A"  

    # Calculate the leading forms
    form_scores = calculate_form_scores(year_totals)
    top_form_score = form_scores.values.max || 0
    @leading_form = top_form_score.positive? ? 
    "Lead Form#{form_scores.select { |_form, score| score == top_form_score }.keys.size > 1 ? 's' : ''}: " + 
    form_scores.select { |_form, score| score == top_form_score }.keys.join(", ") : 
    "Lead Form: N/A"
  
  end

  def results
    @events = Event.all.order("id ASC")
  end

  private

  def total_score(result)
    result.turing + result.winston + result.sharman + result.ennis
  end

  def calculate_form_scores(year_totals)
    {
      "Turing" => year_totals.sum { |result| result.turing },
      "Winston" => year_totals.sum { |result| result.winston },
      "Sharman" => year_totals.sum { |result| result.sharman },
      "Ennis" => year_totals.sum { |result| result.ennis }
    }
  end
end
