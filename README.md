# LONGEST WORD GAME

### Users must select the longest English word out of a random set of letters in a GRID.

### Main App Features
A user's word is checked with different tests and received a score depending on the length of the word.
This word is also checked to be an English word by parsing a JSON file.
Wrote a simplified version of the game COUNTDOWN, where users are given a random set of letters, from which they must enter the longest english word they can find using only letters in the grid.
The final score depends on the time taken to answer, plus the length of the word submitted, and eventually an error message if you failed.  The longer the word and the quicker the time, the better the score! 


Get familiar with parsing JSON format
Separated program's responsibilities into several sub-methods
Determine what is a JSON, and how it is similar to the structure of a Ruby hash.
Access a web-API, and parse JSON data returned by this API



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
