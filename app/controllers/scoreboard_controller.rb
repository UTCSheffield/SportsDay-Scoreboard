class ScoreboardController < ApplicationController
    def index
        year_totals = Event.select(:year, 'SUM(turing) as turing', 'SUM(winston) as winston', 'SUM(sharman) as sharman', 'SUM(ennis) as ennis').group(:year)
        @leading_year = year_totals.max_by { |result| result.turing + result.winston + result.sharman + result.ennis }.year

        column_with_highest_value = [:turing, :winston, :sharman, :ennis].max_by do |column|
            year_totals.max_by { |result| result.send(column) }.send(column)
        end

        @leading_form = column_with_highest_value.capitalize
    end
    def statistics
        @events = Event.all.order("id ASC")
    end
end