# Match 5 numbers 1-99:  A game or simplified simulation of ML-type optimization algorithms
#
# M.Mueller, Nov. 2014, Developing Data Products course project
#
# Johns Hopkins/Coursera Data Science series

require(shiny)
library(UsingR)

# Guess numbers
comp_num <- floor(runif(5, 1,100)) 
x<-NULL; y<-NULL

shinyServer(
    function(input, output) {
        output$compnums <- renderText({comp_num})
#        score <- (comp_num[1]-input$num1)^2 + (comp_num[2]-input$num2)^2 +
#            (comp_num[3]-input$num3)^2 + (comp_num[4]-input$num4)^2 + (comp_num[5]-input$num5)^2
        output$score <- renderText({
            input$goButton
            isolate( score <<- (comp_num[1]-input$num1)^2 + (comp_num[2]-input$num2)^2 +
            (comp_num[3]-input$num3)^2 + (comp_num[4]-input$num4)^2 + (comp_num[5]-input$num5)^2) })
        output$guesses <- renderText({input$goButton})  
        output$plotScore <- renderPlot({input$goButton
                                        isolate({plot(x<<-c(x,input$goButton),y<<-c(y,score), col='red',
                                            main="Score as function of Updates", cex=2, pch=19, 
                                            xlab="Number of Updates", ylab="Score (or Error)")
                                        })
                                    })
    }
)