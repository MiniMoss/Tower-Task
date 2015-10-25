class Team < ActiveRecord::Base
  has_many :users, through :accesses
  has_many :projects
end
