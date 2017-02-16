

ui <- fluidPage(
  
  
  navbarPage(title = "EXPLORE", 
    
    tabPanel(title = "Statistics", 
             wellPanel(
               
               fluidRow(  
                 column(3),
                 column(5,sliderInput(inputId = "num",
                                      label = "Choose a number",
                                      value = 25, min = 1, max = 1000)
                 )
               ),
               
               fluidRow(
                 column(3),
                 column(5,   textInput(inputId = "title",
                                       label = "Write a title",
                                       value = "Histogram of FB data"))
               ),
               
               fluidRow(
                 column(3),
                 column(5,  actionButton(inputId = "update",
                                         label = "Update"),
                        
                        useShinyjs(),
                        actionButton(inputId = "hide",
                                     label = "Hide/Show")
                 )
               )
             ),
             wellPanel(
               plotOutput("hist"), 
               verbatimTextOutput("Stats")
             )
             
          ),
    
    
    tabPanel(title = "View Data", 
             numericInput("obs", "Number of Observations to view:", 10),
             #submitButton("Update View"),
             tableOutput("view") )
    
  )

  
  
  
  
)