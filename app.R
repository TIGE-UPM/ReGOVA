library(ggpubr)
library(shinythemes)
library(leaflet)
library(readxl)
library(ggplot2)

#Carga del excel a un fichero data
data <- read_excel("C:/Users/Natalia/Desktop/salida.xlsx")

## UI ##

ui <- fluidPage(theme = shinytheme("cerulean"),
                
                #barra de navegación
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
                                        plotOutput("corrPlot")),
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
    
    #definición de la paleta de colores de los círculos del mapa para cada pregunta
    pal3 <- colorFactor(
        palette = c('red', 'yellow', 'green'),
        domain = data$web 
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
        domain = data$pedido 
    )
    pal9 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$RRSS 
    )
    pal10 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$importancia 
    )
    pal11 <- colorFactor(
        palette = c('red', 'yellow', 'green'),
        domain = data$covid 
    )
    pal12 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$presonline 
    )
    pal13 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$conocimiento 
    )
    pal14 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange'),
        domain = data$inversion 
    )
    pal15 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange'),
        domain = data$invfutura 
    )
    pal16 <- colorFactor(
        palette = c('green', 'red', 'yellow', 'pink', 'purple', 'orange', 'blue'),
        domain = data$tiempo 
    )
    
    
    #se crea un mapa con leaflet y se añade círculos azules por cada muestra
    output$mymap <- renderLeaflet({
        leaflet(data) %>% 
            setView(lng = -3.741661, lat = 40.386622, zoom = 14)  %>% #se centra el mapa
            addTiles() %>% 
            addCircles(data = data, lat = ~latitude, lng = ~longitude, weight = 6, radius = 3, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) #generar circulo azul y etiqueta por cada punto
    })
    
    #la función observe para hacer el checkbox dinamico. Cuando se pulsa la primera vez presenta el filtro, y para que al desmarcar desaparezca el filtro hay que llamar de nuevo al mapa.
    observe({
        data$web <- ifelse(data$P3.2 != 0, "No", ifelse(data$P3.1 !=0, "Sí", "Ns/nc")) #se define el filtro
        proxy <- leafletProxy("mymap", data = data) #se llama al mapa
        if (input$P3){#si se marca el checkbox de p3
            proxy %>% clearControls() #limpia la leyenda
            proxy%>% clearMarkers() #limpia los círculos de colores pero no es necesario pues al pintar los siguientes borra los anteriores
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
            proxy %>% addCircleMarkers(layerId= 10, stroke = FALSE, color = ~ pal3(web),radius = 10, fillOpacity = 0.7, label = ~as.character(paste0( P2, sep = " " ,"CNAE: ", sep = " ", P1 ))) %>%  #se pintan los círculos de colores según el filtro anterior y la etiqueta
                addLegend("bottomright", pal = pal3, values = data$web, # se pinta la leyenda en el mapa
                          title = "Página web",
                          opacity = 1)
            
            ## HISTOGRAMA ##
            output$distPlot <- renderPlot({
                ggplot(data, aes(data$web))      +
                    geom_bar()             +
                    labs(x = 'Página web', y= 'Número de comercios')
            })
        } 
        else {}
    })
    observe({
        data$presonline <- ifelse(data$P4 ==0 , "0", ifelse(data$P4 ==1 , "1", ifelse(data$P4 ==2, "2", ifelse(data$P4 >=3, "3 o +", "Ns/nc"))))#recorro todas las filas de la columna que diga 
        proxy <- leafletProxy("mymap", data = data)
        
        if (input$P4) {
            proxy %>% clearControls()
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else {}
    })
    observe({
        data$tonline <- ifelse(data$P5.2 != 0, "No", ifelse(data$P5.1 !=0, "Sí", "Ns/nc"))
        proxy <- leafletProxy("mymap", data = data)
        
        if (input$P5) {
            proxy %>%  clearControls() 
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else {}
    })
    observe({
        data$pago <- ifelse(data$P6 == 0, "0", ifelse(data$P6 ==1, "1",ifelse(data$P6 ==2, "2", ifelse(data$P6 ==3, "3",ifelse(data$P6 ==4, "4",ifelse(data$P6 ==5, "5",ifelse(data$P6 ==6, "6","Ns/nc")))))))
        proxy <- leafletProxy("mymap", data = data)
       
        if (input$P6) {
            proxy%>% clearControls() 
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else {}
    })
    observe({
        data$envios <- ifelse(data$P7.1 !=0, "No envío", ifelse(data$P7.2 !=0, "Trabajador", ifelse(data$P7.3 !=0, "Nuevo trabajador", ifelse(data$P7.4 !=0, "Mensajeria", ifelse(data$P7.5 !=0, "Last mile", "Ns/nc")))))
        proxy <- leafletProxy("mymap", data = data)
        
        if (input$P7) {
            proxy  %>% clearControls() 
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else {}
    })
    observe({
        data$pedido <- ifelse(data$P8 ==6, "6",ifelse(data$P8 ==5, "5",ifelse(data$P8 ==4, "4",ifelse(data$P8 ==3, "3", ifelse(data$P8 ==2, "2", ifelse(data$P8 ==1, "1", ifelse(data$P8 ==0, "0", "Ns/nc")))))))
        proxy <- leafletProxy("mymap", data = data)
        
        if (input$P8) {
            proxy %>% clearControls() 
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else {}
    })
    observe({
        data$RRSS <- ifelse(data$P9 ==6, "6",ifelse(data$P9 ==5, "5",ifelse(data$P9 ==4, "4",ifelse(data$P9 ==3, "3", ifelse(data$P9 ==2, "2", ifelse(data$P9 ==1, "1", ifelse(data$P9 ==0, "0", "Ns/nc")))))))
        proxy <- leafletProxy("mymap", data = data)
       
        if (input$P9) {
            proxy %>% clearControls()
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else {}
    })
    observe({
        data$importancia <- ifelse(data$P10.1 !=0, "1", ifelse(data$P10.2 !=0, "2", ifelse(data$P10.3 !=0, "3", ifelse(data$P10.4 !=0, "4", ifelse(data$P10.5 !=0, "5", "Ns/nc")))))
        proxy <- leafletProxy("mymap", data = data)
        
        if (input$P10) {
            proxy  %>% clearControls()
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else {}
    })
    observe({
        data$covid <- ifelse(data$P11.1 !=0, "Sí", ifelse(data$P11.2 !=0, "No","Ns/nc"))
        proxy <- leafletProxy("mymap", data = data)
        
        if (input$P11) {
            proxy %>% clearControls()
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else {}
    })
    observe({
        data$planteamiento <- ifelse(data$P12.1 !=0, "No", ifelse(data$P12.2 !=0, "No planteado",ifelse(data$P12.3 !=0,  "Planteándomelo", ifelse(data$P12.4!=0, "Voy a empezar", ifelse(data$P12.5!=0, "Estoy en proceso", ifelse(data$P12.6!=0, "Ya lo he hecho","Ns/nc"))))))
        proxy <- leafletProxy("mymap", data = data)
        
        if (input$P12) {
            proxy %>% clearControls()
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else {}
    })
    observe({
        data$conocimiento <- ifelse(data$P13.1 !=0, "Sí", ifelse(data$P13.2 !=0, "Sé a quien acudir",ifelse(data$P13.3 !=0,  "Aprenderé",ifelse(data$P13.4 !=0,  "No sé","Ns/nc"))))
        proxy <- leafletProxy("mymap", data = data)
        
        if (input$P13) {
            proxy %>% clearControls()
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else { }
    })
    observe({
        data$inversion <- ifelse(data$P14 == 0, "0", ifelse((data$P14 > 0 & data$P14 <=300), "1-300",ifelse((data$P14 > 1000 & data$P14 <=3000), "1001-3000", ifelse((data$P14 > 300 & data$P14 <=1000), "301-1000",ifelse(data$P14>3000, "+3000", "other")))))
        proxy <- leafletProxy("mymap", data = data)
        
        if (input$P14) {
            proxy  %>% clearControls()
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else {}
    })
    observe({
        data$invfutura <- ifelse(data$P15 <= 100, "0-100", ifelse((data$P15 <= 300 & data$P15 >100), "101-300", ifelse((data$P15 <= 1000 & data$P15 >300), "301-1000",ifelse((data$P15 <= 3000 & data$P15 >1000), "1001-3000",ifelse(data$P15>3000, "+3000", "Ns/nc")))))
        proxy <- leafletProxy("mymap", data = data)
        
        if (input$P15) {
            proxy %>% clearControls()
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P16", value= FALSE)
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
        else {}
        
    })
    observe({
        data$tiempo <- ifelse(data$P16 <= 3, "0-3", ifelse((data$P16 <= 10 & data$P16 >3), "4-10", ifelse((data$P16 <= 15 & data$P16 >10), "11-15",ifelse((data$P16 <= 30 &  data$P16 >15), "16-30", ifelse(data$P16 >30, "+30", "Ns/nc")))))
        proxy <- leafletProxy("mymap", data = data)
        
        if (input$P16) {
            proxy  %>% clearControls()
            updateCheckboxInput(session, "P3", value= FALSE)
            updateCheckboxInput(session, "P4", value= FALSE)
            updateCheckboxInput(session, "P5", value= FALSE)
            updateCheckboxInput(session, "P6", value= FALSE)
            updateCheckboxInput(session, "P7", value= FALSE)
            updateCheckboxInput(session, "P8", value= FALSE)
            updateCheckboxInput(session, "P9", value= FALSE)
            updateCheckboxInput(session, "P10", value= FALSE)
            updateCheckboxInput(session, "P11", value= FALSE)
            updateCheckboxInput(session, "P12", value= FALSE)
            updateCheckboxInput(session, "P13", value= FALSE)
            updateCheckboxInput(session, "P14", value= FALSE)
            updateCheckboxInput(session, "P15", value= FALSE)
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
        else {}
        
    })
    ## CORRELACION ##
    
    output$corrPlot <- renderPlot({
        y <-input$variabley
        x<-input$variablex
        e<-input$analisis
       
        ggscatter(data, x = x, y= y,#datos y valores para x e y
                  add = "reg.line", conf.int = TRUE, #linea y sombra gris
                  cor.coef = TRUE, cor.method = e, #coeficientes y el tipo de correlacion
                  main=("Correlación"), xlab =  input$variable2, ylab = input$variable1)
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)


