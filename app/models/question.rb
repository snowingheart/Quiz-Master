class Question < ActiveRecord::Base

  validates_presence_of :answer, :query

  def correct_answer proposed_answer
    own_answer = self.answer.downcase.strip
    proposed_answer = proposed_answer.downcase.strip
    if own_answer == proposed_answer
      return true
    else
      if proposed_answer =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
        massaged_answer = proposed_answer.to_f.to_words
        if proposed_answer.to_words == own_answer
          return true
        end
      end
      if own_answer =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
        massaged_answer = own_answer.to_f.to_words
        if massaged_answer == proposed_answer
          return true
        end
      end
    end
    return false
  end
  
end
