library(shiny)

ui <- fluidPage(
  titlePanel("Hello Shiny !"),
 
   sidebarLayout(
    # sidebar panel for inputs
     sidebarPanel(
       sliderInput(inputId = "bins",
                   label = "Number of bins:",
                   min = 1,
                   max = 50,
                   value = 30)
     ),
     
     # main  panel for output
     mainPanel(
       # Histogram output
       plotOutput(outputId = "distPlot"),
       
       plotOutput(outputId = "distPlotEruptions")
     )
  )
)

server <- function(input,output,session){
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x,
         breaks = bins,
         col = "steelblue", 
         border = "white",
         xlab = "Waiting time to next eruption(in mins)",
         main ="Histogram of waiting times")
  })
  
  output$distPlotEruptions <- renderPlot({
    x <- faithful$eruptions
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x,
         breaks = bins,
         col = "seagreen",
         border = "black",
         xlab = "Length of Eruptions(in mins)",
         main = "Histogram of Eruption Times")
  })
}

shinyApp(ui,server)










