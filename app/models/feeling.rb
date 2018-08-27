class Feeling <ActiveRecord::Base


  def self.get_feeling_score(feeling_choice)
    feeling = Feeling.find(feeling_choice+Feeling.first.id-1)
    feeling.score
  end

end
