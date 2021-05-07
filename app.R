library(shiny)
library(ggpubr)
library(shinythemes)
library(leaflet)
library(dplyr)
library(leaflet.extras)
library(readxl)
library(ggplot2)

data <- read_excel("C:/Users/Natalia/Desktop/excel.xlsx")

## UI ##

ui <- fluidPage(theme = shinytheme("cerulean"),
                
                navbarPage("ReGOVA",
                           
                           #Navbar1
                           tabPanel("Análisis descriptivo",
                                    sidebarLayout(
                                        #mapa
                                        mainPanel(
                                            splitLayout(
                                                leafletOutput(outputId = "mymap"),
                                                plotOutput("distPlot"))
                                        ),
                                        #preguntas
                                        sidebarPanel(h4("Preguntas:"), 
                                                     checkboxInput("P3", "¿Tiene página web?", FALSE),
                                                     checkboxInput("P4", "¿Dónde aparece su negocio?", FALSE),
                                                     checkboxInput("P5", "¿Tiene tienda online?", FALSE),
                                                     checkboxInput("P6", "Métodos de pago aceptados", FALSE),
                                                     checkboxInput("P7", "Métodos de envío", FALSE),
                                                     checkboxInput("P8", "¿A través de que medios se pueden hacer pedidos?", FALSE),
                                                     checkboxInput("P9", "¿En qué redes sociales tiene presencia?", FALSE),
                                                     checkboxInput("P10", "¿Qué importancia le daria a la digitalización?", FALSE),
                                                     checkboxInput("P11", "¿Ha tomado mayor importancia a raíz del COVID-19?", FALSE),
                                                     checkboxInput("P12", "¿Se plantea la digitalización de su negocio?", FALSE),
                                                     checkboxInput("P13", "¿Tiene claros los pasos a seguir para digitalizarse?", FALSE),
                                                     checkboxInput("P14", "¿Qué inversión ha realizado en digitalización?", FALSE),
                                                     checkboxInput("P15", "¿Cuánto plantea invertir en digitalización?", FALSE),
                                                     checkboxInput("P16", "¿Cúantos años lleva abierto su negocio?", FALSE)
                                        ),
                                    )
                           ),
                           
                           #Navbar 2
                           tabPanel("Correlación", 
                                    mainPanel(
                                        #correlacion
                                        plotOutput("corrPlot"),),
                                    sidebarPanel(
                                        #opciones correlacion
                                        selectInput("variablex", h4("Variable x:"),
                                                    c("Inversión realizada" = "P14")
                                        ),
                                        selectInput("variabley", h4("Variable y:"),
                                                    c("Años abierto" = "P16")
                                        ),
                                        selectInput("analisis", h4("Análisis estadístico:"),
                                                    c("Pearson" = "pearson")
                                        ))
                           )
                )
)

## SERVIDOR ##

server <- function(input, output, session) {
    ## MAPA ##
    #defino la paleta de colores de los círculos del mapa para cada pregunta
    pal3 <- colorFactor(
        palette = c('red', 'yellow', 'green'),
        domain = data$web #pagina web
    )
    
    pal4 <- colorFactor(
        palette = c('green', 'red', 'yellow','pink'),
        domain = data$presonline 
    )
    pal5 <- colorFactor(
        palette = c('red', 'yellow', 'green'),
        domain = data$tonline 
    )
    pal6 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$pago 
    )
    pal7 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange'),
        domain = data$envios 
    )
    pal8 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$pedido #pagina web
    )
    pal9 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$RRSS #pagina web
    )
    pal10 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$importancia #pagina web
    )
    pal11 <- colorFactor(
        palette = c('red', 'yellow', 'green'),
        domain = data$covid #pagina web
    )
    pal12 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$presonline #pagina web
    )
    pal13 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$conocimiento #pagina web
    )
    pal14 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange'),
        domain = data$inversion #color segun la inversion
    )
    pal15 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange'),
        domain = data$invfutura #color segun la inversion futura
    )
    pal16 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$tiempo #color segun la inversion futura
    )
    
    
    #creo el mapa cpn leaflet y añado circulos azules por cada muestra
    output$mymap <- renderLeaflet({
        leaflet(data) %>% 
            setView(lng = -3.741661, lat = 40.386622, zoom = 14)  %>% #centrar el mapa
            addTiles() %>% 
            addCircles(data = data, lat = ~latitude, lng = ~longitude, weight = 10, radius = 10, fillOpacity = 0.2, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) #generar circulo azul
    })
    
    #usamos la funcion observe para hacer el checkbox dinamico. Cuando pulso la primera vez presenta el filtro, y para que al desmarcar desaparezca el filtro tengo que llamar de nuevo al mapa.
    observe({
        data$web <- ifelse(data$P3.2 != 0, "no", ifelse(data$P3.1 !=0, "si", ifelse(data$P3.3 !=0, "Ns/nc", "otro"))) #defino mi filtro
        proxy <- leafletProxy("mymap", data = data) #llamoo al mapa
        proxy %>% clearControls()#limpio  la leyenda
        #updateCheckboxInput(session, "P4", value= FALSE) #con esto pongo a false P4 osea que lo desmarco pero queda en el estado inicial en vez de representar el P3
        
        if (input$P3){#si marco el checkbox de p3
            #pinto los circulos de colores según el filtro anterior
            proxy %>% addCircleMarkers(layerId= 10, stroke = FALSE, color = ~ pal3(web),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal3, values = data$web,
                          title = "Página web",
                          opacity = 1)
            
            ## HISTOGRAMA ##
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$web))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Página web', y= 'Número de comercios')
            })
        } 
        else {
            proxy %>% clearMarkers() %>% clearControls() %>% clearMarkerClusters()
        }
    })
    observe({
        data$presonline <- ifelse(data$P4 ==3 , "3", ifelse(data$P4 ==2, "2", ifelse(data$P4 ==1, "1", "otro")))#recorro todas las filas de la columna que diga 
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P4) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal4(presonline),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal4, values = data$presonline,
                          title = "Presencia online",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$presonline))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Presencia online',y= 'Número de comercios' ) 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
    })
    observe({
        data$tonline <- ifelse(data$P5.2 != 0, "no", ifelse(data$P5.1 !=0, "si", ifelse(data$P5.2!=0,"Ns/nc", "otro")))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P5) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal5(tonline),radius = 10, fillOpacity = 0.7,label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal5, values = data$tonline,
                          title = "Tienda online",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$tonline))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Tienda online', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
    })
    observe({
        data$pago <- ifelse(data$P6 == 0, "0", ifelse(data$P6 ==1, "1", "Ns/nc"))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P6) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal6(pago),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal6, values = data$pago,
                          title = "Métodos de pago",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$pago))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Métodos de pago', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
    })
    observe({
        data$envios <- ifelse(data$P7.1 !=0, "no envio", ifelse(data$P7.2 !=0, "trabajador", ifelse(data$P7.3 !=0, "nuevo trabajador", ifelse(data$P7.4 !=0, "mensajeria", ifelse(data$P7.5 !=0, "last mile", "other")))))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P7) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal7(envios),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal7, values = data$envios,
                          title = "Envíos",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$envios))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Envíos', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
    })
    observe({
        data$pedido <- ifelse(data$P8 ==3, "3", ifelse(data$P8 ==2, "2", ifelse(data$P8 ==1, "1", ifelse(data$P8 ==0, "0", "Ns/nc"))))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P8) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal8(pedido),radius = 10, fillOpacity = 0.7,label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal8, values = data$pedido,
                          title = "Pedidos",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$pedido))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Pedidos', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
    })
    observe({
        data$RRSS <- ifelse(data$P9 ==3, "3", ifelse(data$P9 ==2, "2", ifelse(data$P9 ==1, "1", ifelse(data$P9 ==0, "0", "Ns/nc"))))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P9) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal9(RRSS),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal10, values = data$RRSS,
                          title = "Redes sociales",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$RRSS))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Redes sociales', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
    })
    observe({
        data$importancia <- ifelse(data$P10.1 !=0, "1", ifelse(data$P10.2 !=0, "2", ifelse(data$P10.3 !=0, "3", ifelse(data$P10.4 !=0, "4", ifelse(data$P10.5 !=0, "5", "0")))))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P10) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal10(importancia),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal10, values = data$importancia,
                          title = "Importancia",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$importancia))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Importancia', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
    })
    observe({
        data$covid <- ifelse(data$P11.1 !=0, "Si", ifelse(data$P11.2 !=0, "No",ifelse(data$P11.3 !=0,  "Ns/nc","a")))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P11) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal11(covid),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal11, values = data$covid,
                          title = "Influencia del COVID",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$covid))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Influencia del COVID', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
    })
    observe({
        data$planteamiento <- ifelse(data$P12.1 !=0, "No", ifelse(data$P12.2 !=0, "No planteado",ifelse(data$P12.3 !=0,  "Planteandomelo", ifelse(data$P12.4!=0, "Voy a empezar", ifelse(data$P12.5!=0, "Estoy en proceso", ifelse(data$P12.6!=0, "Ya lo he hecho","Ns/nc"))))))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P12) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal12(planteamiento),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal12, values = data$planteamiento,
                          title = "Estadio del proceso",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$planteamiento))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Estadio del proceso', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
    })
    observe({
        data$conocimiento <- ifelse(data$P13.1 !=0, "Si", ifelse(data$P13.2 !=0, "Se a quien acudir",ifelse(data$P13.3 !=0,  "Aprendere","Ns/nc")))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P13) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal13(conocimiento),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal13, values = data$conocimiento,
                          title = "Conocimientos ",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$conocimiento))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Conocimientos', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
    })
    observe({
        data$inversion <- ifelse(data$P14 <= 100, "0-100", ifelse(data$P14 <= 300 | data$P14 >100, "101-300", ifelse(data$P14 <= 1000 | data$P14 >300, "301-1000",ifelse(data$P14 <= 3000 | data$P14 >1000, "1001-3000",ifelse(data$P14>3000, "+3000", "other")))))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P14) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal14(inversion),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal14, values = data$inversion,
                          title = "Inversión",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$inversion))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Inversión', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
    })
    observe({
        data$invfutura <- ifelse(data$P15 <= 100, "0-100", ifelse(data$P15 <= 300 | data$P15 >100, "101-300", ifelse(data$P15 <= 1000 | data$P15 >300, "301-1000",ifelse(data$P15 <= 3000 | data$P15 >1000, "1001-3000",ifelse(data$P15>3000, "+3000", "other")))))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P15) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal15(invfutura),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal15, values = data$invfutura,
                          title = "Inverión futura",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$invfutura))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Inversión futura', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
        
    })
    observe({
        data$tiempo <- ifelse(data$P16 <= 3, "0-3", ifelse((data$P16 <= 10 | data$P16 >3), "4-10", ifelse((data$P16 <= 15 | data$P16 >10), "11-15",ifelse((data$P16 <= 30 | data$P16 >15), "16-30", "+30"))))
        proxy <- leafletProxy("mymap", data = data)
        proxy %>% clearMarkers()
        if (input$P16) {
            proxy %>% clearControls()
            proxy %>% addCircleMarkers(stroke = FALSE, color = ~ pal16(tiempo),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%
                addLegend("bottomright", pal = pal16, values = data$tiempo,
                          title = "Tiempo abierto",
                          opacity = 1)
            ## HISTOGRAMA ##
            
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$tiempo))      +
                    geom_bar()             + # 'stat' isn't needed here.
                    labs(x = 'Tiempo abierto', y= 'Número de comercios') 
            })
        }
        else {
            proxy %>% clearMarkers() %>% clearControls()
        }
        
    })
    ## CORRELACION ##
    
    output$corrPlot <- renderPlot({
        y <-input$variabley
        x<-input$variablex
        e<-input$analisis
       
        ggscatter(data, x = x, y= y,#bbdd y valores para x e y
                  add = "reg.line", conf.int = TRUE, #linea y sombra gris
                  cor.coef = TRUE, cor.method = e, #coeficientes y el tipo de correlacion
                  main=("Correlación"), xlab =  input$variable2, ylab = input$variable1)
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)


