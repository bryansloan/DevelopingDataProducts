## Developing Data Products: Project 1
## Start ui.R

# Load the needed library
library(shiny)

# Define UI

shinyUI(pageWithSidebar(

    # Create a page title
        
    headerPanel('Bumper Repair Costs'),
    
    # Define the side panel and controls
    
    sidebarPanel(

        # Display some explanatory text for the user
            
        p("This application provides researchers the ability to determine 
         actual bumper repair costs for the vehicle models in our dataset."),
        br(),
        p("The results returned here can be used to predict the accuracy of 
         repair estimates and work invoices in any future analysis."),
        br(),

        # Create a text input control for a name
        
        textInput(inputId="name1", label = "Enter your name", value = "All Results"),

        # Create numeric input controls for the search

        numericInput(inputId="value1", label = "Enter a minimum cost", value = 0, min = 0, max = 10000),
        numericInput(inputId="value2", label = "Enter a maximum cost", value = 10000, min = 0, max = 10000),
        
        # Create an action control so the user has to click
        
        submitButton("Submit")

    # Close sidebarPanel
    
    ),

    # Define the main panel to display results

    mainPanel(

        # Display the personalized report text

        h5(htmlOutput("reportheader")),

        # Tell the panel to be tabbed (included here but not used)
        
        # tabsetPanel(

        # Name the first tab (included here but not used)

        # tabPanel('bumpers',

            # Display the search results

            dataTableOutput("bumperresults1")

        # Close tabPanel (included here but not used)
        
        # )
        
        # Close tabsetPanel (included here but not used)
        
        # )

    # Close mainPanel

    )

# Close pageWithSidebar

)

# Close shinyUI

)

## End ui.R