require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = [*('A'..'Z')].sample(10)
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    results = JSON.parse(open(url).read)
    if results["found"]
      @won = "Yaey"
    else @won = "Nayy"
    end
  end
end
