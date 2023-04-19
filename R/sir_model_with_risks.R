sir_model_with_risks <- function(time,state,parameters){

  
  time = seq(from=1,to=1000,by=0.1)
  
  with(as.list(c(state,parameters)),{
    
    # Retrieve parameters
    recovery_time = parameters[[1]]
    contacts = parameters[[2]]
    transmibility = parameters[[3]]
    
    gamma_param = 1/recovery_time
    contacts = contacts
    beta_param = contacts * transmibility
    
    
    # Calculate populations
    N = S + I
    dS =  - beta_param*(I/N) * S +  gamma_param * I 
    dI = + beta_param*(I/N) * S - gamma_param * I 
    
    return(list(c(dS,dI)))
  }
  )
}


