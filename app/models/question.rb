class Question < ActiveRecord::Base

  validates_presence_of :answer, :query

  def correct_answer proposed_answer
    own_answer = self.answer.downcase.strip
    proposed_answer = proposed_answer.downcase.strip
    puts "checking if #{proposed_answer} matches #{own_answer}"
    if own_answer == proposed_answer
      return true
    else
      puts "they do not simply match so we're checking numbers"

      if proposed_answer =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
        puts "given answer is a number(written in digits)"
        massaged_answer = proposed_answer.to_f.to_words
        if proposed_answer.to_words == own_answer
          return true
        end
      end
      if own_answer =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
        puts "answer is a number(written in digits)"
        massaged_answer = own_answer.to_f.to_words
        puts "matching #{massaged_answer} to #{proposed_answer}"
        if massaged_answer == proposed_answer
          return true
        end
      end
    end
    return false
  end
  
end
