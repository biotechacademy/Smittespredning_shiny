server <- function(input, output) {
  line_size = 1
  BA_pink <- "#d3317d"
  BA_blaa <- "#61acde"
  BA_orange <- "#f5c54a"
  BA_groen <- "#bbd44c"
  
  output$plot <- renderPlot({
    
    parameters <- c(input$gamma_param, input$contacts, input$prop_protection/100)
    
    # Initial states in model
    initial_states <- c(S=input$total_pop-input$inf_pop, I =input$inf_pop)
    
    # Generate output
    SIR_output<-as.data.frame(ode(y=initial_states,func = sir_model_with_risks,parms=parameters,times = seq(from=1,to=200,by=1)))
    
    # Plot
    ggplot(data = SIR_output, mapping = aes(x=time)) +
      geom_line(aes(y = S, color = "S"), size = line_size) + 
      geom_line(aes(y = I, color= "I"), size = line_size) + 
      
      
      xlab("Måneder") + 
      ylab("Antal personer") +
      
      # Use specific colors
      scale_color_manual(name = "Gruppe", values = c("S" = BA_groen, "I" = BA_pink), labels = c("Modtagelige", "Inficerede")) 
    
  }
  )
  
  output$plot2 <- renderPlot({
    parameters <- c(input$gamma_param2, input$contacts2, input$prop_protection2, input$alpha_param)
    
    # Initial states in model
    initial_states <- c(S=input$total_pop2-input$inf_pop2, I =input$inf_pop2, R = 0)
    
    # Generate output
    SIR_output<-as.data.frame(ode(y=initial_states,func = sir_model_hpv,parms=parameters,times = seq(from=1,to=300,by=1)))
    
    # Plot
    ggplot(data = SIR_output, mapping = aes(x=time)) + 
      geom_line(aes(y = S, color = "S"), size = line_size) + 
      geom_line(aes(y = I, color= "I"), size = line_size) + 
      geom_line(aes(y = R, color= "R"), size = line_size) + 
      
      xlab("Måneder") + 
      ylab("Antal personer") +
      
      scale_color_manual(name = "Gruppe", values = c(S = BA_groen, I = BA_pink, R = BA_blaa), labels = c("Modtagelige", "Inficerede", "Raske/Immune"))
  })
  
}