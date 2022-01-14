#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
    withMathJax(),
    # Application title
    titlePanel("Instrumental Variable"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            numericInput(
                inputId = "n",
                label = "N. Obs.",
                value = 1e3
                ),
            numericInput(
                inputId = "beta", 
                label = "\\(\\beta\\)", 
                value = 5),
            numericInput(
                inputId = "gamma",
                label = "\\( \\gamma \\)",
                value = 50
                ),
            plotOutput("plot")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h1("The model is:"),
            h2("\\(Y_i = \\alpha + \\beta X_i + \\gamma A_i + \\epsilon_i\\)"),
            h1("You do not observe \\(A_i\\), so your estimation model is:"),
            h2("\\(Y_i = \\alpha + \\beta X_i + u_i\\)"),
            h2("Where \\(u_i = \\gamma A_i + \\epsilon_i\\), making \\(X_i\\) endogenous"),
            htmlOutput("reg")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    

    output$reg <- function(){
        set.seed(43)
        n <- input$n
        beta <- input$beta
        gamma <- input$gamma
        
        z <- rbinom(n = n, size = 1, 0.8)
        a <- rnorm(n, 3, 2)
        x <- rnorm(n, 0, 1) + (a > 3 | z == 1)
        u <- rnorm(n, 0, 0.1)
        y <- 1 + (beta * x) + (gamma * a) + u
        ols <- lm(y ~ x)
        first <- lm(x ~ z)
        x <- predict(first)
        second <- lm(y ~ x)
        
        models <- list("Naive OLS" = ols,
                       "First stage" = first,
                       "Second stage" = second)
        
        modelsummary::modelsummary(models,
                                   stars = T,
                                   gof_omit = "Adj|IC|Log")
    }
    
    output$plot <- renderPlot({
        set.seed(43)
        n <- input$n
        beta <- input$beta
        gamma <- input$gamma
        
        z <- rbinom(n = n, size = 1, 0.5)
        a <- rnorm(n, 3, 2)
        x <- rnorm(n, 0, 1) + (a > 3 | z == 1)
        u <- rnorm(n, 0, 0.1)
        y <- 1 + (beta * x) + (gamma * a) + u
        
        plot(data.frame(y, x, a, u, z))
    })
    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
