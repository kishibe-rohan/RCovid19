
#Loading libraries
library(shiny)
library(data.table)
library(dplyr)
library(reshape2)

#Load dataset
covidata <- read.csv('C:/Users/HP/Desktop/DSCoursera/covid_19.csv')

#get top10 countries by confirmed cases
confIdx <- order(-covidata[,"Confirmed"],covidata[,"Country.Region"])
conf <- covidata[confIdx,c(1,2),drop = FALSE]
conf <- conf[1:10,]

#get top10 countries by death cases
deathIdx <- order(-covidata[,"Deaths"],covidata[,"Country.Region"])
death <- covidata[deathIdx,c(1,3),drop = FALSE]
death <- death[1:10,]

#get top10 countries by recovered cases
recIdx <- order(-covidata[,"Recovered"],covidata[,"Country.Region"])
rec <- covidata[recIdx,c(1,4),drop = FALSE]
rec <- rec[1:10,]

#get top10 countries by active cases
actIdx <- order(-covidata[,"Active"],covidata[,"Country.Region"])
act <- covidata[actIdx,c(1,5),drop = FALSE]
act <- act[1:10,]

actPlot <- function()
{
    par(mfrow=c(1,1))
    barplot(act$Active,main="Countries by Active",las=3,space=0.1,width=1,names.arg = act$Country.Region,col=rainbow(20),horiz=FALSE)
    axis(2,at= seq(0,3000000,500000))
}

recPlot <- function()
{
    par(mfrow=c(1,1))
    barplot(rec$Recovered,main="Countries by Recovered",space=0.1,width=1,las=3,names.arg = rec$Country.Region,col=rainbow(20),horiz=FALSE)
    axis(2,at= seq(0,1500000,200000))
}

deathPlot <- function()
{
    par(mfrow=c(1,1))
    barplot(death$Deaths,main="Countries by Death",space=0.1,width=1,las=3,names.arg = death$Country.Region,col=rainbow(20),horiz=FALSE)
    axis(2,at= seq(0,150000,20000))
}

confPlot <- function()
{
    par(mfrow=c(1,1))
    barplot(conf$Confirmed,main="Countries by Confirmed",space=0.1,width=1,las=3,names.arg = conf$Country.Region,col=rainbow(20),horiz=FALSE)
    axis(2,at= seq(0,4000000,500000))
}


server<- function(input,output)
{
    #generate plot according to user input
    output$plot <- renderPlot({
        p <- switch(input$var,
                    "Active" = actPlot(),
                    "Recovered" = recPlot(),
                    "Confirmed"= confPlot(),
                    "Deaths"= deathPlot()
        )
           
                
    })
        
        
      
}
