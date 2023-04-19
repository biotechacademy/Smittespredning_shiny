second_panel <- function(){
  #### SIDE BAR ####
  sidebar_content <- sidebarPanel(
    sliderInput(
      inputId = "total_pop", 
      label = "1. Det totale antal personer", 
      min=50, max=1000, value= c(50)),
    
    sliderInput(
      inputId = "inf_pop", 
      label = "2. Antal inficerede personer ved start", 
      min=0, max=50, value= c(0)),
    
    sliderInput(
      inputId = "prop_protection", 
      label = "3. Sandsynligheden for at sygdommen bliver overført ved en seksuel kontakt", 
      min=0, max=1, value= c(0.1), step = 0.01),
    
    sliderInput(
      inputId = "contacts", 
      label = "4. Antal seksuelle kontakter per person månedligt", 
      min=0, max=10, value= c(1)),
    
    sliderInput(
      inputId = "gamma_param", 
      label = "5. Antal måneder før en person bliver testet og dermed går i behandling?", 
      min=0.5, max=24, value= c(1), step=0.5)
  )
  
  #### MAIN CONTENT ####
  main_content <- mainPanel(
    plotOutput("plot")
  )
  
  #### PANEL ####
  tabPanel(
    "Spredning uden immunitet",
    titlePanel("Spredning uden immunitet"),
    wellPanel(fluidRow(
      column(1,img(src = "SIS.png", height = 300)),
    )),
    
    
    p("Brug sliderne nedenfor til at ændre på spredningen af sygdommen."),
    sidebarLayout(
      sidebar_content, main_content
    ),
    wellPanel(fluidRow(
      #column(1,img(src = "SIS.png", height = 300)),
      column(12,HTML("Denne matematiske  model viser hvordan en sygdom spredes i en befolkning. 
    I denne model kan individer enten kan være fuldt modtagelige over for den specifikke sygdom ELLER inficerede med sygdommen.<br> 
    Det betyder at man IKKE kan være immun. <br>
    Derfor er denne model egnet til sygdomme, som ikke giver den inficerede person betydelig immunitet efter sygdomsforløbet. <br>
    Det kan f.eks. være sygdomme som Klamydia eller Gonoré. 
    
    <br>
    <br>
    
    Du kan ændre på forskellige parametre i modellen. Parametrene har betydning for hvordan sygdommen spreder sig i en befolkning.
    
    <br>
    <b>Parameter nr. 1: Totalt antal personer </b> <br>
    <ul>
      <li>Antallet af personer der er i populationen. Da der ikke er nogen der fødes eller dør i modellen, er dette tal det samme under hele simuleringen.</li>
    </ul>
    
    <br>
    <b>Parameter nr. 2: Antal inficerede personer ved start </b> <br>
    <ul>
      <li>Antallet af personer, der er inficerede med sygdommen ved simuleringen start. Ofte vælges 1 (patient zero).</li>
    </ul>
    
    <br>
    <b>Parameter nr. 3: Sandsynligheden for at sygdommen bliver overført ved en seksuel kontakt</b> <br>
    <ul>
      <li>Sandsynligheden for overførsel er høj når der ikke bruges beskyttelse og lav når der bruges beskyttelse </li>
      <li>Denne har betydning for infektionsraten.</li>
      <li>Jo større sandsynlighed for en transmission, jo flere bliver der smittet.</li>
    </ul>
    
    <br>
    
    <b>Parameter nr 4. Antal seksuelle kontakter per person månedligt </b> <br>
    <ul>
      <li> Gennemsnitligt antal personer én person har seksuel kontakt med på en måned </li>
      <li> Denne har betydning for infektionsraten.</li>
      <li> Jo større denne parameter er, jo flere seksuelle kontakter har hver person, og så spreder sygdommen sig hurtigere.</li>
    </ul>
    
    <br>
    
    <b>Parameter nr 5. Antal måneder der går før en person bliver rask </b> <br>
    <ul>
      <li> For sygdomme, hvor der findes en behandling (f.eks. antibiotika mod bakterielle sygdomme), er denne parameter et udtryk for hvor lang tid der går før folk bliver testet og dermed går i behandling. </li>
      <li> For sygdomme, hvor immunforsvaret selv bekæmper sygdommen (f.eks. mange vira), er denne parameter et udtryk for hvor lang tid sygdommen kan inficere andre. </li>
      <li> Parameteren har betydning for raskhedsraten. </li>
      <li> Hvis der går længe for man bliver testet og går i behandlig, vil man have mere tid som inficeret til at sprede sygdommen.</li>
    </ul>
    
    <br>
    
    
    Nedenfor kan du ændre på forskellige parametre, der har betydning for hvordan sygdommen spreder sig."))
    ))
  )
}