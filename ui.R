library(shiny)
shinyUI(pageWithSidebar(
	headerPanel("Predict Final Grade from First and Second Period Grades"),
	sidebarPanel(
		numericInput('id1', 'First Period Grade', "",  min = 0, max = 20, step = 1),
		numericInput('id2', 'Second Period Grade', "", min = 0, max = 20, step = 1),
		radioButtons('id3', "Gender",
			c("None Selected" = "",
			  "Female" = "Female",
			  "Male" = "Male"),
			inline = TRUE),
		submitButton('Submit')
	),
	mainPanel(
		h3('Result of Prediction'),
		h4('First Period Grade Entered'),
		verbatimTextOutput("oid1"),
		h4('Second Period Grade Entered'),
		verbatimTextOutput("oid2"),
		h4('Gender Entered'),
		verbatimTextOutput("oid3"),
		h4('Which Resulted in a Prediction of Final Grade:'),
		verbatimTextOutput("prediction")
	)

))