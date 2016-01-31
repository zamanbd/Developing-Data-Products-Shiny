
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)


library(rCharts)

shinyUI(
    navbarPage("Data Explorer for Electric Power Generation in Canada",
        tabPanel("Plot",
                sidebarPanel(
                        uiOutput("choose_geo"),
                        uiOutput("choose_prod"),
                        uiOutput("choose_genType")
                    
               ),
  
                mainPanel(
                    tabsetPanel(
                        
#                         
                        # Time series data
                        tabPanel(p(icon("line-chart"), "Timeseries"),
                                 h4('Electricity generation over time (MW-h)', align = "center"),
                                 plotOutput('plot')
                        ),
                        

                        
                        # Data 
                        tabPanel(p(icon("table"), "Data"),
                            tableOutput("myts")
                            
                        )
                    )
                )
            
        ),
        
        tabPanel("About",
            mainPanel(
                includeMarkdown("include.md")
            )
        )
    )
)
