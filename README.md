# The-Word-Definer


#### Epicodus Ruby and Rails - Routing with Ruby Project - 2019.07.26

#### By Ben Bennett-Cauchon

## Heroku Deployment

https://tranquil-ravine-67458.herokuapp.com/words

## Description

A learning website for kids on which children can write up a list of words they don't know (but would like to learn) and then com up with their own definitions.

## Specs

| Behavior | Input | Output |
| ------------- |:-------------:| -----:|
| The homepage of the app lists all words | Homepage url in a browser | A list of all words added to the page |
| When a word is clicked it leads to a page with the word's definitions | Click on word on homepage | A page with the word's definitions |
| Words can be added to the list | Click on "Add a word" link | A form for adding a new word |
| Submitting new word form adds the word to the list | Click on "ADD WORD" button | A list of all words added that includes the new word |
| When viewing a word a user is able to add one or more definitions | Click on "Add a new definition" link | Form for adding a definition for the word |
| Submitting new definition form adds the definition to a word's definitions | Click on "ADD DEFINITION" button in new definition form for a word | List of all definitions for the word that includes the new definition |
| When viewing a word a user is able to update definitions | Click on definition | Form which allows the definition to be edited |
| When viewing a word a user is able to delete definitions | Click on definition | List of all definitions with the selected one deleted |

## Setup/Installation Requirements

* click on https://tranquil-ravine-67458.herokuapp.com/words
 to see the page deployed to Heroku

or

* clone/download the repository
* navigate to the directory in a terminal
* run the commands
  `bundle install && ruby app.rb`
* open http://localhost:4567 in a web browser

## Known Bugs

There are no known bugs at this time.

## Support and contact details

If you find a bug, run into any issues, or have questions, ideas or concerns please feel free to submit an issue for the project here on GitHub.

## Technologies Used

* ruby
  * class variables and methods
  * initializing with hashes
  * embedded ruby in html
* sinatra
* rspec
* capybary
* pry
* heroku

### License

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2019 Benjamin Bennett-Cauchon
