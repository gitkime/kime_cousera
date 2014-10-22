library("shiny")
library("shinyapps")
library("devtools")
#
## assesment 1
#
#nei <- readRDS("summarySCC_PM25.rds")
##select Emission per year for Baltimore
#baltdy <- subset(nei,nei$fips == "24510")
#res <- rowsum(baltdy$Emissions,baltdy$year)
#lady <- subset(nei,nei$fips == "06037")
#res1 <- rowsum(lady$Emissions,lady$year)
#
## read data in matrix 
res <- matrix(c(3274,2454,3091,1862),nrow=4,ncol=1,dimnames=list(c(1999,2002,2005,2008),c("Pm25")))
res1 <- matrix(c(47103.19,26968.79,22939.78,32135.48),nrow=4,ncol=1,dimnames=list(c(1999,2002,2005,2008),c("Pm25")))

shinyServer(
    function(input, output) {
# reactive input$id2 give id2 to output$oid2   
        output$oid2 <- renderText({
            if (input$id2 == 0) return()
            else if ( input$id2 == 1)  "Plot Baltimore"
            else if ( input$id2 == 2) "Plot Los Angelis"
        })
# make plot in dependence of id2 value
        output$myHist <- renderPlot({
            if (input$id2 == 0) return()
            else if (input$id2 == 1){
# Generate a summary of the dataset
                output$head <- renderPrint({
                head(res)
                })
# prepare  plot                
            b <- barplot(res[,1],ylab="PM25 in Tons",xlab="Years",axes=T,col = c("lightblue", "mistyrose","lightcyan", "lavender"),main="Emissions PM25 from 1999-2008 for Baltimore")
            text(x=b,y=c(res[1:1,],res[2:2,],res[3:3,],res[4:4,]),labels=c(round(res[1:1,],0),round(res[2:2,],0),round(res[3:3,],0),round(res[4:4,]),0),pos=3,col="black",cex=.75)
            mu <- input$mu
            abline(c(mu, mu), c(0, 200),col="red",lwd=5)
            mse <- mean((res[,1] - mu)^2)
            text(round(res[2:2,]-120), paste("mu = ", mu))
            abline(0,0)
            }
          else if (input$id2 == 2){
              # Generate a summary of the dataset
              output$head <- renderPrint({
              head(res1)
              })
              # prepare  plot              
              b <- barplot(res1[,1],ylab="PM25 in Tons",xlab="Years",axes=T,col = c("lightblue", "mistyrose","lightcyan", "lavender"),main="Emissions PM25 from 1999-2008 L.A.")
              abline(0,0)
            
          }
        })
    
    })