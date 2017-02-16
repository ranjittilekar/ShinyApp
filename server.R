

server <- function(input , output) {
  
  # data <- reactive({
  #   read.csv('pseudo_facebook.tsv', sep = '\t')
  # })
  
  
  data <- eventReactive(input$update, {
    read.csv('pseudo_facebook.tsv', sep = '\t')
  })

  observeEvent(input$hide, {
    #hide("hist")
    toggle("hist") 
  })
  

   output$hist <- renderPlot({ 
     
     ggplot(aes(x = age, y = friend_count),data = data()) + 
      geom_point(alpha = 1/20, 
                 position = position_jitter(height = 0),
                 color = 'Orange') + 
      xlim(13,isolate(input$num)) + 
      coord_trans(y = "sqrt") +
      geom_line(stat = 'summary', fun.y = mean, color = 'red') +
      geom_line(stat = 'summary', fun.y = quantile, fun.args = list(probs = .1),
                linetype = 5, color = 'blue') +
      geom_line(stat = 'summary', fun.y = quantile, fun.args = list(probs = .5),
                linetype = 1, color = 'black') +
      geom_line(stat = 'summary', fun.y = quantile, fun.args = list(probs = .9),
                linetype = 5, color = 'blue')+
      ggtitle(isolate(input$title))
   })


  
  output$Stats <- renderPrint({
    summary(data())
  })
  
  
  output$view <- renderTable({
    head(data(), n = (input$obs))
  })
  
}