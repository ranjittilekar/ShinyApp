


#setwd("C:/Users/rtilekar/Desktop/R/MyShiny")
setwd("/Shiny/My First App")
#install.packages('shinyjs')

library(shinyjs)
library(ggplot2)
library(shiny)


source('ui.R') 
source('server.R') 


shinyApp(ui = ui, server = server)