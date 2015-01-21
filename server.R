## Developing Data Products: Project 1
## Start server.R

# Load the needed libraries

library(UsingR)                         # Load R datasets

library(shiny)                          # Load shiny library

# Load and clean our dataset

data(bumpers)                           # Get our data from the R datasets

df<-data.frame(bumpers)                 # Read data into data frame

df$model<-as.character(row.names(df))   # Copy row.names to a new column

row.names(df) <- NULL                   # Remove the row.names column

df<-df[,c(2,1)]                         # Move second column to be first

colnames(df) <- c("model", "cost")      # Set preferred column names

#Create a basic function for the input and output

shinyServer(function(input, output) {

    # Define an output for the data rows returned to the search

    output$bumperresults1 = renderDataTable({

        # Read data into temp table and subset only the search results
            
        dfTemp <- df
        subset(dfTemp, cost >= input$value1 & cost <= input$value2)
        
    # Close the renderDataTable with options for page length
    
    }, options = list(lengthMenu = c(5, 10, 50), pageLength = 10))

    # Define an output for the search results custom heading
    
    output$reportheader <- renderUI({

        # Create personalized strings
        
        string1 <- paste("This custom search is for ", input$name1)
        string2 <- paste("Range is from", input$value1, "to", input$value2, "dollars")
        
        # Enclose the strings in an html wrapper
        
        HTML(paste(string1, string2, sep = '<br/>'))

    # Close the renderUI
    
    })

# Close the function

}

# Close shinyServer

)

## End server.R