ui <- dashboardPage(
  dashboardHeader(title="Essential Fish Habitat Application"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Habitat Maps",tabName="map"),
      tags$hr(style="border-color: white;"),
      #tags$head(includeCSS("efhStyle.css")),
      #div(h3("Select species"),style="text-align: center;"),
      div(
        selectInput("selectSpecies", h3("Select species:"),
                    c("Red drum" = "REDDRUM",
                      "Red snapper" = "REDSNAPPER"
                    ),
                    selected = "REDDRUM")),
      div(
        selectInput("lifestage",h3 ("Select lifestage:"),
                    c("Spawning Adult"= "spawningAdult",
                      "Adult" = "adult"),
                    selected = "spawningAdult")
      ),
      tags$hr(style="text-align: center;"),
      
      div(img(src="logo.png"), style="text-align: center;")
      
      
    )),
  dashboardBody(
    tags$style(type = "text/css", "#map {height: calc(100vh - 80px) !important;}"),
    #tags$style(type = "text/css", "#sp {height: calc(100vh - 80px) !important;}"),
    tabItems(
     
      ## Map ##
      tabItem(tabName='map',
              leafletOutput('map',height=600),
              textOutput('out')
              
      
      
      
      
    ))))
