library(shiny)


# Data processing libraries

library(dplyr)
library(stringr)

# Required by includeMarkdown
library(markdown)



# Load data

elecCan <- read.csv("./data/01270002-eng.csv", header = TRUE, sep = ",")

spltDate <- str_split_fixed(elecCan$Ref_Date,"/",2)

elecCan <- elecCan %>%
        mutate(YEAR = as.integer(spltDate[,1]) , MONTH = as.integer(spltDate[,2])) %>%
        mutate(VALUE = as.numeric(as.character(Value))) %>%
        select(YEAR, MONTH, GEO, ELECPRO,ELECGEN,VALUE)
rm("spltDate")

lgeo <- unique(elecCan$GEO)
lpro <- unique(elecCan$ELECPRO)
lgen <- unique(elecCan$ELECGEN)

# Shiny server 
shinyServer(function(input, output) {
    
    # Drop-down selection of geo-location
        output$choose_geo <- renderUI({
        selectInput("geo", "Geographic Location", choices=as.list(as.character(lgeo)), selected = "Canada" )
        })
    
        # Drop-down selection of producer type
        output$choose_prod <- renderUI({
                selectInput("prod", "Type of Producer", choices=as.list(as.character(lpro)), selected = "Total all classes of electricity producer" )
        })
    
        # Drop-down selection of geo-location
        output$choose_genType <- renderUI({
                selectInput("gen", "Generation Type", choices=as.list(as.character(lgen)), selected = "Total all types of electricity generation Hydraulic turbine")
        })

    
    
        
    # Render Plots and output
        output$plot <- renderPlot({
                fileterd <- 
                        elecCan %>% 
                        filter(GEO==input$geo, ELECGEN==input$gen, ELECPRO == input$prod) %>% 
                        select(VALUE) 
                validate(need(length(fileterd)!= 0, "No data found for this option. Please change your selection"))
                mts <- ts(fileterd, start=c(2008, 1), end=c(2015, 11), frequency=12)
                plot(mts)
        })
    
    output$myts <- renderTable({
             myvec <- 
                     elecCan %>% 
                     filter(GEO==input$geo, ELECGEN==input$gen, ELECPRO == input$prod) %>% 
                     select(VALUE)  
             mts <- ts(myvec, start=c(2008, 1), end=c(2015, 11), frequency=12)
             mts
    })
})



