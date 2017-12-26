
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  output$jaja.panel = renderUI({
    input$selector
    paste("A simple test with ",selected.choice,".",sep="")
  })
  
  output$select.type = renderUI({
    selectInput(inputId="select",label="Select type",
                choices=types)
  })
  
  observe({
    selected.choice <<- input$select 
  })
  
  output$A.panel = renderUI({
    input$select
    sidebarLayout(sidebarPanel(list(selectInput(inputId="A",
                                                label="A",
                                                choices=c("A.a","A.b"),
                                                selected=1),
                                    conditionalPanel("input.A=='A.a'",
                                                     uiOutput("side.outA1")),
                                    conditionalPanel("input.A=='A.b'",
                                                     uiOutput("side.outA2")))),
                  mainPanel(list(conditionalPanel("input.A=='A.a'",
                                                  uiOutput("main.outA1")),
                                 conditionalPanel("input.A=='A.b'",
                                                  uiOutput("main.outA2"))))
      )
  })
  output$side.outA1 = renderUI({
    paste("Some text for side.outA1: selected=",selected.choice,sep="")
  })
  output$side.outA2 = renderUI({
    paste("Some text for side.outA2: selected=",selected.choice,sep="")
  })
  output$main.outA1 = renderUI({
    verbatimTextOutput("text.main.outA1")
  })
  output$main.outA2 = renderUI({
    verbatimTextOutput("text.main.outA2")
  })
  output$text.main.outA1 = renderPrint({
    cat("This is A, with selection ",input$A, " and selected choice: ",selected.choice)
  })
  output$text.main.outA2 = renderPrint({
    cat("This is A, with selection ",input$A, " and selected choice: ",selected.choice )
  })
  output$B.panel = renderUI({
    sidebarLayout(sidebarPanel(list(selectInput(inputId="B",
                                                label="B",
                                                choices=c("B.a","B.b"),
                                                selected=1),
                                    conditionalPanel("input.B=='B.a'",
                                                     uiOutput("side.outB1")),
                                    conditionalPanel("input.B=='B.b'",
                                                     uiOutput("side.outB2")))),
                  mainPanel(list(conditionalPanel("input.B=='B.a'",
                                                  uiOutput("main.outB1")),
                                 conditionalPanel("input.B=='B.b'",
                                                  uiOutput("main.outB2"))))
    )
  })
  output$side.outB1 = renderUI({
    paste("Some text for side.outB1: selected=",selected.choice,sep="")
  })
  output$side.outB2 = renderUI({
    paste("Some text for side.outB2: selected=",selected.choice,sep="")
  })
  output$main.outB1 = renderUI({
    verbatimTextOutput("text.main.outB1")
  })
  output$main.outB2 = renderUI({
    verbatimTextOutput("text.main.outB2")
  })
  output$text.main.outB1 = renderPrint({
    cat("This is B, with selection ",input$B, " and selected choice: ",selected.choice)
  })
  output$text.main.outB2 = renderPrint({
    cat("This is B, with selection ",input$B, " and selected choice: ",selected.choice)
  })
})
