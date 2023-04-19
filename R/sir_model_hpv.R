sir_model_hpv <- function(time,state,parameters){
  # Plot parameters
  BA_pink <- "#d3317d"
  BA_blaa <- "#61acde"
  BA_orange <- "#f5c54a"
  BA_groen <- "#bbd44c"
  
  line_size = 1
  
  # Time points
  time=seq(from=1,to=100,by=0.1)
  
  with(as.list(c(state,parameters)),{
    
    # Retrieve parameters
    recovery_time = parameters[[1]]
    contacts_monthly = parameters[[2]]
    transmission_risk_percent = parameters[[3]]
    alpha_monthly = parameters[[4]]
    
    transmission_risk =transmission_risk_percent
    gamma_param = 1/recovery_time
    contacts_monthly = contacts_monthly
    beta = contacts_monthly * transmission_risk
    
    
    if (alpha_monthly > 0) {
      alpha = 1/alpha_monthly
    }
    else {
      alpha = 0
    }
    
    # Calculate populations
    N= S + I + R
    
    dS =  - beta * (I/N) * S + alpha * R
    dI = + beta * (I/N) * S - gamma_param * I
    dR = + gamma_param * I - alpha * R
    return(list(c(dS, dI, dR)))
  }
  )
}



