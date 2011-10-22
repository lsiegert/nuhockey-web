class Game < ActiveRecord::Base
  LOCATIONS = ['home', 'away', 'neutral']
  SEASONS   = ['2004-05', '2005-06', '2006-07', '2007-08', '2008-09', '2009-10', '2010-11', '2011-12']
  validates_inclusion_of :location, :in => LOCATIONS
  validates_inclusion_of :season, :in => SEASONS
end