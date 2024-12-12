class ScoreboardController < ApplicationController
  before_action :allow_iframe_requests

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end

  def index
    # Calculate the total scores for each year
    year_totals = Event.select(:year, 'SUM(turing) AS turing', 'SUM(winston) AS winston', 'SUM(sharman) AS sharman', 'SUM(ennis) AS ennis')
                       .group(:year)

    # Calculate the max total score using database-level operations
    max_total = year_totals.order('turing + winston + sharman + ennis DESC').first
    max_score = max_total.turing + max_total.winston + max_total.sharman + max_total.ennis

    # Find all year groups with the max total score
    leading_years = year_totals.where('turing + winston + sharman + ennis = ?', max_score)

    # If the max score is zero, return "N/A", otherwise return all years with the max score
    @leading_year = max_score.zero? ? 'N/A' : leading_years.pluck(:year).join(', ')

    # Find the column with the highest individual score
    columns = [:turing, :winston, :sharman, :ennis]
    column_with_highest_value = columns.max_by { |column| Event.maximum(column) }

    # Return the leading form (capitalized)
    @leading_form = column_with_highest_value.to_s.capitalize
  end

  def results
    # Add pagination if necessary for performance
    @events = Event.all.order("id ASC")
  end
end
