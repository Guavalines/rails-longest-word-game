# ✍️ LONGEST WORD GAME

## Description
### This is a game where users are given a random set of letters, from which they must enter the longest english word they can find using only letters from a grid. This word is checked to be an English word by parsing a JSON file. The final score depends on the time taken to answer, plus the length of the word submitted.

## Features

- Access a web-API and parse JSON data returned by this API.


## Views
![Longest-Word-Game](https://user-images.githubusercontent.com/100665876/210687814-06658c9c-c935-4fc3-9525-3626fbc50d86.jpeg)

![Result](https://user-images.githubusercontent.com/100665876/210687890-8dc14a32-4244-4f9c-97a3-411a576cbee1.jpeg)

![Congrats](https://user-images.githubusercontent.com/100665876/210687931-ab5a4df7-4692-436e-a7b3-c3bb81140712.jpeg)

routes.rb

```
Rails.application.routes.draw do
  root 'games#new'
  get '/new', to: 'games#new'
  post '/score', to: 'games#score'
  get '/result', to: 'games#result'
  get '/show', to: 'games#show'
end
```

games_controller.rb

```
require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    range = ("A".."Z").to_a
    @letters = []
    9.times { @letters.push(range.sample) }
    @letters
  end

  def score
    @guess = params[:guess]
    @letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{@guess}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    @result = analysis(user, @guess, @letters)
    redirect_to result_path(message: @result)
  end

  def analysis(user, guess, letters)
    session[:past_wins] ||= []
    if guess.chars.all? { |letter| guess.count(letter) <= letters.count(letter.upcase) } && user['found'] == true
      session[:past_wins] << guess.length
      "Congratulations! #{guess} is a valid English word!"
    elsif user['found'] == false
      session[:past_wins] << 0
      'not an english word'
    else
      session[:past_wins] << 0
      "Sorry, but #{@guess} can't be build out of the grid"
    end
  end

  def result
    @result = params[:message]
  end

  def show
    @final_score = session[:past_wins].sum
  end
end
```


## Initialize these before starting the app:

### Versions

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white) 3.0.3p157 (2021-11-24 revision 3fb7d2cadc) [x86_64-linux]

![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white) 7.0.2.2


### Setup

```
 git clone git@github.com:guavalines/rails-longest-word-game.git
 cd rails-longest-word-game
 rails db:create db:migrate db:seed:replant
 bundle install
 yarn install
 rails server
```
Open you browser and visit localhost:3000
