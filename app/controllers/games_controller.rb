class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    word = params[:word]
    letters = params[:letters].split('')
    if !word.chars.all? {|char| letters.include?(char) }
      @result = "Sorry,'#{word}'cannot be build from the original grid."
    else
      score = calculate_score(word)
      @result = "Congratulations! '#{word}' is a valid word and your score is #{score}."
    end
  end
