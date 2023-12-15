donut_chart_function <- function(x,...){


  highchart() |>
    hc_chart(type = "pie") |>
    hc_add_series(data = department_numbers %>%
                    ungroup() %>%
                    filter(department == x, h_m = ...) %>%
                    select(y,h_m,color),
                  size = '70px',
                  innerSize="60%",
                  dataLabels = list(distance = -20,
                                    pointFormat = "<b style = 'font-size: 1.05rem;font-weight : 100;'>{point.y}</b>"
                  ))

}






table_function <- function(data){

  data %>%

  reactable(
    # style = list(fontFamily = 'Roboto'),
    pagination = FALSE,
    height = 'auto',
    width = 305,
    # striped = TRUE,
    highlight = TRUE,
    # bordered = TRUE,
    defaultPageSize = 10,
    # filterable = TRUE,
    showSortIcon = TRUE,
    showPageSizeOptions = TRUE,
    pageSizeOptions = 5,

    theme = reactable::reactableTheme(
      borderColor = "transparent",
      borderWidth = .5,
      stripedColor = "#f6f8fa",
      highlightColor = "#f0f5f9",
      backgroundColor = '#fff', # cells background
      cellPadding = 1,
      style = list(fontFamily = "Exo 2",
                   fontSize = 10),
      searchInputStyle = list(width = "100%"),
      tableStyle = list(border = '2px'),

      headerStyle = list(
        # padding = '7.5px',
        background = "transparent")

    ),

    defaultColDef = reactable::colDef(

      vAlign = "center",
      headerVAlign = "bottom",
      align = 'left',
      style  = list(fontWeight = "bold",
                    backgroundColor = 'transparent'),
      headerStyle = list(background = "transparent"),

      footerStyle = list(fontWeight = "bold")
    ),

    columns = list(

      techProfessions = reactable::colDef(
        name = "Score >>",

        width = 150,
        style = list(
          fontSize = 12,
          # background = "#FFB67A",
          marginLeft = '10px',
          marginTop = '2.5px',
          paddingTop = '10.5px',


          borderRadius = '5px',
          color = '#484848',
          fontWeight = ''
        ),
        headerStyle = list(position = "sticky",
                           left = 0,
                           background = "transparent",
                           zIndex = 0)
      ),

      idades = reactable::colDef(
        name = "",
        align = 'center',
        width = 50,
        style = list(
          fontSize = 12,
          background = "#FFB67A",
          marginLeft = '10px',
          marginTop = '2.5px',
          borderRadius = '5px',
          color = 'whitesmoke',
          fontWeight = ''
        ),
        headerStyle = list(position = "sticky",
                           left = 0,
                           background = "transparent",
                           zIndex = 0)
      ),

      vector = reactable::colDef(
        name = "",
        width = 50,
        align = 'center',
        style = list(
          fontSize = 12,
          background = "#484848",
          marginLeft = '10px',
          marginTop = '2.5px',

          borderRadius = '5px',
          color = 'whitesmoke',
          fontWeight = ''
        ),
        headerStyle = list(position = "sticky",
                           left = 0,
                           background = "transparent",
                           zIndex = 0)
      )))

}

column_chart_function <- function(data){

 data %>%
    hchart(
   'column',
   names = 'SQUADS',

   hcaes(x = dates,
         y = idades),
   color = '#FFB67A',
   name = 'Homem',
   groupPadding = 0.5, pointWidth = 20
 ) %>%
    hc_xAxis(
      enabled = TRUE,
      title = NULL,
      labels = list(enabled = TRUE)
    )%>%
    hc_yAxis(enabled = TRUE,
             title = '',
             labels = list(enabled = TRUE),
             tickAmount = 5,
             gridLineWidth = 0.5,
             gridLineColor = 'lightgray',
             gridLineDashStyle = "dash",
             plotLines = list(list(
               dashStyle = NULL,
               color = NULL,
               width = 0,
               zIndex = 0)))%>%
    hc_plotOptions(
      series = list(borderRadius = 2.5)

    )


}


double_column_chart <- function(x_data, y_data, type_chart){


  x_data %>%
    hchart(
      type_chart,
      names = 'SQUADS',

      hcaes(x = idades_age_interval ,
            y = n),
      color = '#484848',
      name = 'Homem',
      groupPadding = 0.5, pointWidth = 30
    ) %>%
    hc_xAxis(
      title = "",
      showInLegend = FALSE
    )%>%

    hc_yAxis(enabled = FALSE,
             title = '',
             labels = list(enabled = FALSE),
             tickAmount = 5,
             gridLineWidth = 0.5,
             gridLineColor = 'lightgray',
             gridLineDashStyle = "dash",
             plotLines = list(list(
               dashStyle = NULL,
               color = NULL,
               width = 0,
               zIndex = 0)))%>%
    hc_add_series(data = y_data,
                  showInLegend = FALSE,
                  hcaes(x = idades_age_interval ,
                        y = n),
                  name = 'Homem',
                  color = '#FFB67A' ,
                  groupPadding = 0.5, pointWidth = 15,

                  type = 'column')%>%
    hc_plotOptions(
      series = list(borderRadius = 2.5),
      column = list(

        dataLabels= list(
          enabled = TRUE,
          pointFormat = "<b style = 'font-size: 1.15rem;font-weight : 100;'>{point.y}</b>"
        )))

}
double_bar_chart <- function(x_data, y_data, type_chart){


  x_data %>%
    hchart(
      type_chart,
      names = 'SQUADS',

      hcaes(x = niveisEducacao ,
            y = n),
      color = '#484848',
      name = 'Homem',
      groupPadding = 0.5, pointWidth = 30
    ) %>%
    hc_xAxis(
      title = "",
      showInLegend = FALSE,
      labels = list(
        style = list(fontSize = '10px')
      )
    )%>%

    hc_yAxis(enabled = FALSE,
             title = '',
             labels = list(enabled = FALSE),
             tickAmount = 5,
             gridLineWidth = 0.5,
             gridLineColor = 'lightgray',
             gridLineDashStyle = "dash",
             plotLines = list(list(
               dashStyle = NULL,
               color = NULL,
               width = 0,
               zIndex = 0)))%>%
    hc_add_series(data = y_data,
                  showInLegend = FALSE,
                  hcaes(x = niveisEducacao ,
                        y = n),
                  name = 'Homem',
                  color = '#FFB67A' ,
                  groupPadding = 0.5, pointWidth = 15,

                  type = type_chart)%>%
    hc_plotOptions(
      series = list(borderRadius = 2.5),
      column = list(

        dataLabels= list(
          enabled = TRUE,
          pointFormat = "<b style = 'font-size: 1.15rem;font-weight : 100;'>{point.y}</b>"
        )))

}


education_bar_chart <- function(x_data, y_data, type_chart){
  x_data %>%
    hchart(
      type_chart,
      names = 'SQUADS',

      hcaes(x = niveisEducacao ,
            y = n/2),
      color = '#484848',
      name = 'Homem',
      groupPadding = 0.5, pointWidth = 30
    ) %>%
    hc_xAxis(
      title = "",
      showInLegend = FALSE,
      labels = list(
        style = list(fontSize = '10px')
      )
    )%>%

    hc_yAxis(enabled = FALSE,
             title = '',
             labels = list(enabled = FALSE),
             tickAmount = 5,
             gridLineWidth = 0.5,
             gridLineColor = 'lightgray',
             gridLineDashStyle = "dash",
             plotLines = list(list(
               dashStyle = NULL,
               color = NULL,
               width = 0,
               zIndex = 0)))%>%
    hc_add_series(data = y_data,
                  showInLegend = FALSE,
                  hcaes(x = niveisEducacao ,
                        y = n),
                  name = 'Homem',
                  color = '#FFB67A' ,
                  groupPadding = 5, pointWidth = 15,

                  type = type_chart)%>%
    hc_plotOptions(
      series = list(borderRadius = 2.5),
      column = list(

        dataLabels= list(
          enabled = TRUE,
          pointFormat = "<b style = 'font-size: 1.15rem;font-weight : 100;'>{point.y}</b>"
        )))

}
