class Event < ApplicationRecord
  has_paper_trail
  broadcasts_refreshes
end
