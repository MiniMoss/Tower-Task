class Project < ActiveRecord::Base
  belongs_to :team
  has_many :todos
  has_and_belongs_to_many :events
end
