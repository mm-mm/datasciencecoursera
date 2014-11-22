# Match 5 numbers 1-99:  A game or simplified simulation of ML-type optimization algorithms
#
# M.Mueller, Nov. 2014, Developing Data Products course project
#
# Johns Hopkins/Coursera Data Science series


require(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Match 5 numbers by reducing error to 0!"),
    sidebarPanel(
        sliderInput('num1', 'Choose a number',value = 50, min = 1, max = 99, step = 1),
        sliderInput('num2', 'Choose a number',value = 50, min = 1, max = 99, step = 1),
        sliderInput('num3', 'Choose a number',value = 50, min = 1, max = 99, step = 1),
        sliderInput('num4', 'Choose a number',value = 50, min = 1, max = 99, step = 1),
        sliderInput('num5', 'Choose a number',value = 50, min = 1, max = 99, step = 1),
        actionButton("goButton", label="Update!")
    ),
    mainPanel(
        h3('Find Five Computer-Generated Numbers 1-99:'),
        h5('This may be viewed as a game, or a learning experience which is similar to the'),
        h5('optimization performed by a computer running a machine learning algorithm.'),
        h4('Your score is the sum of the differences (computer`s numbers - your numbers) squared.'),
        h6('Zero is a perfect score!  How many tries to get to zero?  
              Be patient!   If you can get a score <10 in less than 40 tries, you are doing really well.  
              If you guess all 5 numbers the first time, you are either telepathic or a good hacker...
              (try set.seed in R before running the app).  A mathematician can finish in 10 tries!'),
        h5(' '),
        h5('Adjust the numbers (one at a time or more), then hit the Update Button!'),
        h3('Your score = '),
        textOutput('score'),
        h3('Number of Tries:'),
        textOutput('guesses'),
        plotOutput('plotScore')
    )
))

