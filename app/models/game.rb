class Game < ActiveRecord::Base
  LOCATIONS = ['home', 'away', 'neutral']
  SEASONS   = ['2012-13', '2011-12', '2010-11', '2009-10', '2008-09', '2007-08', '2006-07', '2005-06', '2004-05']
  validates_inclusion_of :location, :in => LOCATIONS
  validates_inclusion_of :season, :in => SEASONS
end