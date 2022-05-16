class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end
  def score
    raise
    @letters
  end
end
