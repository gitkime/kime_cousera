shinyUI(pageWithSidebar(
    headerPanel("Show Emissions Pm25 "),
    sidebarPanel(
        sliderInput('mu', 'Show selected Emissions in tons',value = 200, min = 200, max = 4000, step = 50,),
        checkboxGroupInput("id2", "Select only one city",
                           c("Baltimore" = "1",
                             "Los Angelis" = "2"),
                           select=1),
                               
        submitButton('Submit')
        ),
  #main Panel
    mainPanel(
        h3('Show Plot for selected towns Baltimore or L.A.'),
   
        h4('You entered'),
        verbatimTextOutput("oid2"),
   
        h3('Introduction  for Shiny application'),
      
        p('The aim of this assesment ist to write and deploy a Shiny applicaton.
          I took the data from the cousera course "Exploratory Data Analysis".
          There I build the subset for the Towns Baltimore(24510) and L.A (06037).
          '),
             
        p(''),
        code('nei <- readRDS("summarySCC_PM25.rds")'),
        code('    #select Emission per year for Baltimore'),
        code('    baltdy <- subset(nei,nei$fips == "24510")'),
        code('    lady <- subset(nei,nei$fips == "06037")'),
        code('    res <- rowsum(baltdy$Emissions,baltdy$year)'),
        code('    res1 <- rowsum(lady$Emissions,lady$year)'),
        p(''),
        p('With the above statements I would read the data in the Shinyapp. but the
          original data where more than 30Mb, so I build the 2 matrix with this code.'),
        p(''),
        code('res <- matrix(c(3274,2454,3091,1862),nrow=4,ncol=1,'),
        code('dimnames=list(c(1999,2002,2005,2008),c("Pm25"))),'),
        code('res1 <- matrix(c(47103.19,26968.79,22939.78,32135.48),nrow=4,ncol=1,'),
        code('dimnames=list(c(1999,2002,2005,2008),c("Pm25")))'),
        p(''),
        p(''),
        p('In the ShinyApp I divided the screen into a sidePanel for the input data
          and the main Panel. In the InputPanel there is a slider Bar for select the Emissions
          in tons only for the selected town Baltimore (after press submit).
          In the choiseBox you can switch between the cities Baltimore and L.A. which are shown
          then in the mainPanel. You will see also the output of the matrix which express the Emissions in tons for the selected city.
          '),

        h2(' Display matrix '),
        verbatimTextOutput("head"),
        p('Here you can see the Plot for the selected city.'),
        p(''),
        plotOutput('myHist')
    )
))