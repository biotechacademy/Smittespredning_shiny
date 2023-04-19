third_panel <- function(){
  #### SIDE BAR ####
  sidebar_content <- sidebarPanel(
    sliderInput(
      inputId = "total_pop2", 
      label = "1. Det totale antal personer", 
      min=1000, max=1000000, value= c(1000), step = 100),
    
    sliderInput(
      inputId = "inf_pop2", 
      label = "2. Antal inficerede personer ved start", 
      min=0, max=1000, value= c(0)),
    
    sliderInput(
      inputId = "prop_protection2", 
      label = "3. Sandsynligheden for at sygdommen bliver overført ved en seksuel kontakt", 
      min=0, max=1, value= c(0.1), step = 0.01),
    
    sliderInput(
      inputId = "contacts2", 
      label = "4. Antal seksuelle kontakter per person månedligt", 
      min=0, max=10, value= c(0)),
    
    sliderInput(
      inputId = "gamma_param2", 
      label = "5. Antal måneder der går før en person bliver rask", 
      min=0.5, max=48, value= c(0.5)),
    
    sliderInput(
      inputId = "alpha_param", 
      label = "6. Antal måneder en person er immun efter infektion", 
      min=0, max=(10*12), value= c(1)),
  )
  
  #### MAIN PAGE ####
  main_content <- mainPanel(
    plotOutput("plot2")
  )
  
  #### PANEL ####
  tabPanel(
    
    "Spredning MED immunitet",
    
    titlePanel("Spredning MED immunitet"),
    wellPanel(fluidRow(
      column(1,img(src = "SIRS.png", height = 300)),
    )),
    p("Brug sliderne nedenfor til at ændre parametrene i modellen."),
    sidebarLayout(
      sidebar_content, main_content
    ),
    wellPanel(fluidRow(
      #column(1,img(src = "SIS.png", height = 300)),
      column(12,HTML("Denne matematiske  model viser hvordan en sygdom spredes i en befolkning. 
    I denne model kan individer enten kan være fuldt modtagelige over for den specifikke sygdom, inficerede med sygdommen eller raske.<br> 
    Sidstnævnte betyder, at man har haft sygdommen og er blevet immun. <br>
    Derfor er denne model egnet til sygdomme, hvor man efterfølgende er beskyttet mod sygdommen i noget tid efter man har været inficeret.<br>
    Dette er tilfældet for mange vira. 
    
    <br>
    <br>
    
    Du kan ændre på forskellige parametre i modellen. Parametrene har betydning for hvordan sygdommen spreder sig i en befolkning.
    
    <br><br>
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
    
    <b>Parameter nr 6. Antal måneder en person er immun efter infektion </b> <br>
    <ul>
      <li> Antal måneder man er immun efter infektion. Dette kan variere meget fra sygdom til sygdom </li>
      <li>Denne har betydning for mistet immunitet. </li>
      <li>Efter noget tid mister man sin immunitet og er modtagelig igen.</li>
    </ul>
                   "))
    ))
  )
}