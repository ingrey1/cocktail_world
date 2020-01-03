# Description of Cocktail_world
This app made use of a Cocktails API (https://www.thecocktaildb.com/) which lists cocktails by their name, ingredients and recipes.   Our app, Cocktail World, accesses Cocktails API and uses the API’s data to help our app’s user answer one of the following questions:

Option 1:  Given the name of a cocktail, e.g. “Margarita”, show the cocktail’s ingredients and recipe.

Option 2: Given an ingredient, e.g. “vodka”, show all cocktails that contain the given ingredient

Option 3:  “Surprise me”  Just show a random cocktail from the database.

Option 4:  View some basic statistical information for cocktails.

Option 5: Exit the application



## Link to YouTube Tour of the App

[See the app in action here](https://youtu.be/ahhTE4a_xvg)


## Installation Instructions

This application allows the user to search a database of cocktails, based on name or ingredients. 

In order to use the “Cocktail World” app, do the following:

1. Clone the app from this github repository
2. In the Command Line, navigate to the folder on your machine where you downloaded the app
3. Run bundle install.
4. Navigate to the config/environment file and comment out ActiveRecord::Base.logger.level = 1
   This line of code is there so that the user does not see user queries any time they make a command. However, when one runs the file, it will automatically populate a database for usage. This way the app can be used offline and multiple get requests do not have to be used. 
5. Navigate to the app folder in cocktail_world and type on the command line: ruby run.rb
6. Once the database is loaded, uncomment the line from number 4 back in, and re run “ruby run.rb” from the app file. 
7. The app will start and you can enter your selection


## Contributor's Guide

How can I contribute?

Reporting Bugs
Please report any bugs you might find using these guidelines:

Use a clear and descriptive title for the issue to identify the problem
Describe the exact steps which reproduce the problem
Provide specific examples to demonstrate the steps
Describe the behavior your observed after following the steps
Explain which behavior you expected to se see and why
Include screenshots and animated GIFs



Suggesting Enhancements
The developers would be happy to hear your suggestions.
Please use these guidelines when suggesting enhancements to Cocktail World software:

Use a clear and descriptive title for your suggestion
Provide a step-by-step description of the suggested enhancement
Describe the current behavior and explain which behavior you expected to see instead and why
Include screenshots and animated GIFs
Explain why this enhancement would be useful


## Software License

Copyright (c) 2020 Jason Mortensen, Nick Corona and Donny Lobree

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


