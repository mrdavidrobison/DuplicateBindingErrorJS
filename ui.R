
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(
  fluidPage(
    navbarPage("Quark mit Sosse",
               id = "selector",
               tabPanel("Start",
                        uiOutput('jaja.panel')),
               tabPanel("Select",
                        uiOutput("select.type")),
               ##  "Data" tab.
               navbarMenu("Get javascript error",id = "AvsB",
                          tabPanel("A",
                                   uiOutput('A.panel')),
                          tabPanel("B",
                                   uiOutput('B.panel'))
                          )
      )
    
))
