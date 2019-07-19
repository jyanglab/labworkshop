#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


# Define UI for application that draws a histogram
library(shiny)
library(ggplot2)
library(plotly)

dat = read.csv("subset_assoc.csv",stringsAsFactors=FALSE)

ui <- fluidPage(
    titlePanel("Manhattan Plot for GWAS Results"),
    plotlyOutput("manhattan", height="500px"),
    column(1),
    column(9,sliderInput("threshold", label = "Change the threshold to:",
                         min = 5, max = 10, value = 9, step = 0.1, width = "100%"))
)

server <- function(input, output) {
    
    output$manhattan <- renderPlotly({
        p = ggplot(data=dat, aes(x=chr, y=log10p, color=log10p)) + 
            geom_jitter(width=0.45) +
            geom_hline(yintercept = input$threshold) +
            geom_text(aes(x=max(dat$chr)-1, y=input$threshold+0.2,
                          label=paste("Number of obs. above the threshold:",
                                      sum(dat$log10p>=input$threshold))), color=1) +
            scale_x_continuous(breaks=sort(unique(dat$chr)), minor_breaks=NULL) +
            xlab("Chromosome") + ylab("-log10(P-value)") +
            theme_minimal() + theme(legend.position = "none") +
            scale_colour_gradient(low = "steelblue", high = "red")
        pl = ggplotly(p, tooltip = c("x","y"))
        pl$x$data[[2]]$hoverinfo = 'none'
        pl$x$data[[3]]$hoverinfo = 'none'
        pl
    })
}

shinyApp(ui = ui, server = server)