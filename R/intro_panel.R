intro_panel <- function(){
  url <- a("Biotech Academy", href="https://www.biotechacademy.dk/")
  url_materiale <- a("Naturvidenskabelig Seksualundervisning", href = "https://www.biotechacademy.dk/undervisning/gymnasiale-projekter/naturvidenskabelig-seksualundervisning/")
  
  tabPanel(
    "Introduktion",
    
    wellPanel(fluidRow(
      column(1, img(src = "small_BA_logo.png")),
      column(9,
             titlePanel("Biotech Academy")
      ))),
    
    titlePanel("Smittespredningsmodeller"),
    
    tagList("Denne side er en introduktion til sygdomsmodeller i gymnasiet og bruges som et værktøj i", url, "'s undervisningsprojekt: Naturvidenskabelig Sexualundervisning."),
    p("Projektet kan findes her:", url_materiale),
    
    p("Det skal understreges, at modellerne kan bruges til at illustrere brugen af matematiske modeller,
      men simuleringerne er ikke et direkte udtryk for virkeligheden."),
  )
}