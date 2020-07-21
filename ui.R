# Load packages ----
library(shiny)
library(maps)
library(mapproj)


# User interface ----
ui <- fluidPage(
    titlePanel("RCovid-19"),
    
    sidebarLayout(
        sidebarPanel(
           
            helpText("View the Top 10 Covid-19 affected countries based on parameters.."),
            selectInput("var", 
                        label = "Choose a variable to display",
                        choices = c("Active", "Confirmed",
                                    "Recovered", "Deaths"),
                        selected = "Active")
            
            
            
        ),
        
        mainPanel(plotOutput("plot"))
    )
)