library(shiny)

library(AnVIL)
library(dplyr)
library(DT)
library(ggplot2)


base =  avtable("population_descriptor") |> select(`pfb:country_of_recruitment`, `pfb:population_label`) |>
     mutate(country=`pfb:country_of_recruitment`, pop=`pfb:population_label`)

server = function(input, output) {
 output$anc = renderPrint({
  table(base[which(country == input$source),"anc"])
 })
}
