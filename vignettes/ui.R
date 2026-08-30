library(shiny)

library(AnVIL)
library(dplyr)
library(DT)
library(ggplot2)


base =  avtable("population_descriptor") |> select(`pfb:country_of_recruitment`, `pfb:population_label`) |>
     mutate(country=`pfb:country_of_recruitment`, pop=`pfb:population_label`)

ui = fluidPage(
 sidebarLayout(
  sidebarPanel(
   helpText("1KG source vs ancestry"),
   selectInput("source", "country of recruitment", choices=sort(base$country))
   ),
  tabsetPanel(
   tabPanel("ancestry", verbatimTextOutput("anc")),
   tabPanel("about", helpText("Demonstration app"))
  )
 )
)
  
