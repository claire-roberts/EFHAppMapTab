server <- function(input, output) {  
  species <- reactive({
    switch (input$selectSpecies,
            "REDDRUM"="REDDRUM",
            "REDSNAPPER"="REDSNAPPER"
            )
    
  })
  
  lifestage <- reactive({
    switch (input$lifestage,
            "spawningAdult"="spawningAdult",
            "adult"="adult"
            )

    
  })
  
  maplayer2 <- reactive({
    tmp <- subset(a, species==species() & lifestage==lifestage())
    
    tmp <- tmp[1,3]
    
    tmp
  })

output$out <- renderText({
  maplayer2()
  })
  
  # maplayer <- paste0(species(),lifestage()) 
  
  output$map <- renderLeaflet({  
    
    
    map <- leaflet() %>% 
      
      addTiles('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
               options = providerTileOptions(noWrap = TRUE)) %>%
      addTiles('http://server.arcgisonline.com/ArcGIS/rest/services/Reference/World_Boundaries_and_Places/Mapserver/tile/{z}/{y}/{x}',
               options = providerTileOptions(noWrap = TRUE)) %>%
      
      setView(-85, 27.75, zoom = 6) %>% 
      addScaleBar(position="bottomright") %>% 
      #addPolygons(fillColor="#E1AF00", data =ad)
      addTiles(blackAdult) %>%
      addTiles(blackLateJuve) %>%
      addTiles(blackEarlyJuve) %>%
      addTiles(blackSpawningAdult) %>%
       #addTiles(maplayer2())%>%

      addControl( html=
                    '<table><tr><td class="shape"><svg style="width:24px; height:22px;" xmlns="http://www.w3.org/2000/svg" version="1.1"><polygon class="plgn" style="fill: #000000; stroke: #000000; fill-opacity: 0.5; stroke-opacity: 1.0; stroke-width: 1;" points="1.5, 0.5 22.5, 11 22.5, 21.5 1.5, 21.5" /></svg></td><td class="value">Late juvenile</td></tr></table>,
                  <table><tr><td class="shape"><svg style="width:24px; height:22px;" xmlns="http://www.w3.org/2000/svg" version="1.1"><polygon class="plgn" style="fill: #5BE15D; stroke: #5BE15D; fill-opacity: 0.5; stroke-opacity: 1.0; stroke-width: 1;" points="1.5, 0.5 22.5, 11 22.5, 21.5 1.5, 21.5" /></svg></td><td class="value">Adults</td></tr></table>,
                  <table><tr><td class="shape"><svg style="width:24px; height:22px;" xmlns="http://www.w3.org/2000/svg" version="1.1"><polygon class="plgn" style="fill: #E13333; stroke: #E13333; fill-opacity: 0.5; stroke-opacity: 1.0; stroke-width: 1;" points="1.5, 0.5 22.5, 11 22.5, 21.5 1.5, 21.5" /></svg></td><td class="value">Spawning adults</td></tr></table>',
                  position=c("bottomleft"))
    
    # addLayersControl(
    #      overlayGroups = c(GROUP))
    
  })
  

  


  
} ## end server
