[![Waffle.io - Issues in progress](https://waffle.io/justinetroyke/world_citizen.svg?columns=all(https://waffle.io/justinetroyke/world_citizen)

__Prerequisites__

This project assumes you have installed:
Ruby
Rails
Homebrew
Bundle
Faraday
Figaro

__Quick Start:__

run in the comand line
```
bundle install
bundle update
rake db:{drop,create,migrate,seed}
rails s
```

__Heroku Link__

https://world-citizen.herokuapp.com/

__Testing__

To run the full rspec testing suite, run
```rspec```
from the command line

__Purpose of the app__

Gamification of giving back through the purchases you are already making.

A way to encourage companies to build charitable giving into their business model as well as encourage consumers to seek out such products.

* Through World Citizen a user has a passport.
* They can search for products that donates a portion of the proceeds to a charity or non-profit.
* For that product a passport stamp is generated.
* The stamp level will be calculated based on the distance from the user’s location to location of where the charity or non-profit helps people.
* Once they hit complete purchase of the product they are awarded that passport stamp.
* As a user collects stamps in their passport they gain levels of citizenship until they reach World Citizenship.

__Authors__
Justine Troyke
