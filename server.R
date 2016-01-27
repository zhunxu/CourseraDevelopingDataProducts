library(shiny)
library(MASS)

## Read in Data -- put in comment as Shinyapp can't read from web

## temp <- tempfile()
## download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00320/student.zip",temp, mode="wb")
## con <- unzip(temp, "student-mat.csv")
## data <- read.table(con, sep=";", skip=0, header=T)
## unlink(temp)

## Regression Model -- put in comment as Shinyapp can't read from web

## fit.G3 <- lm(G3 ~ G1 + G2 + sex, data)
## coef <- unname(fit.G3$coeff)
## final.grade <- function(a, b, c) coef[1] + coef[2] * a + coef[3] * b + coef[4] * (c == "Male")

final.grade <- function(a, b, c) -1.8878066 + 0.1518633 * a + 0.9857463 * b + 0.1798199 * (c == "Male")

shinyServer(
	function(input, output){
		output$oid1 <- renderPrint({
			validate(
      			need(input$id1 >=0 & input$id1 <= 20, 'Out of Range!')
    			)
			input$id1})
		output$oid2 <- renderPrint({
			validate(
      			need(input$id2 >=0 & input$id2 <= 20, 'Out of Range!')
    			)
			input$id2})
		output$oid3 <- renderPrint({
			validate(
				need(input$id3 != "", 'None Selected')
			)
			input$id3})
		output$prediction <- renderPrint({
			validate(
      			need(input$id1 >=0 & input$id1 <= 20 & input$id2 >=0 & input$id2 <= 20, 'Invalid Input')
    			)
			final.grade(input$id1, input$id2, input$id3)})
	}
)