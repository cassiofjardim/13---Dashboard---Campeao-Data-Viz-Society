library(shiny)
library(shinyWidgets)
library(imola)
library(tidyverse)




# https://public.tableau.com/app/profile/pradeepkumar.g/viz/HRAttritionDashboardRWFD_16570446563570/viz
breakpoint_system <- getBreakpointSystem()

breakpoint_system <- addBreakpoint(
  breakpoint_system,
  breakpoint("md", max = 1180)

)

breakpoint_system <- addBreakpoint(
  breakpoint_system,
  breakpoint("sm", max = 991)

)

# #FFB67A
# #484848
# #959595

ui <- gridPage(
  tags$style(
    "

     body{
    padding: 1em;

    background-image: linear-gradient(
  320deg,
  hsl(27deg 100% 89%) 0%,
  hsl(27deg 83% 90%) 43%,
  hsl(27deg 60% 92%) 52%,
  hsl(26deg 28% 93%) 56%,
  hsl(0deg 0% 93%) 58%,
  hsl(0deg 1% 93%) 59%,
  hsl(0deg 2% 93%) 60%,
  hsl(0deg 3% 94%) 62%,
  hsl(0deg 2% 93%) 66%,
  hsl(0deg 1% 93%) 72%,
  hsl(0deg 1% 92%) 82%,
  hsl(0deg 0% 91%) 100%
);
     }

    @import url('https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap');

    *{

    font-family: 'Lato', sans-serif;
    }

    ul{
    list-style: none;
    }

    ul span{
      display: inline;
    color: #808080a8;
    font-size: .75em;
    float: right;
    font-weight: 600;
    }

    .jobrole_input label.control-label{
    display: none !important;
    }

    .jobrole_input .shiny-input-container-inline{
    float: right;
    }





.header_cards,
.overview,
.attrition_trend,
.demographics,
.survey,
.recent{


    border-radius:5px;
    padding: 1em;
    background: #FFFFFF;

  }

  .div_charts{

  }


   h5 {


   }

h5{
  font-size: 1.15rem;
  font-weight: 600;
  letter-spacing: .35em;
}



  @media only screen and (max-width: 1180px) {



  }

  @media only screen and (max-width: 991px) {

  .card{

   display: none;

  }

}
    "
  ),
  title = "Pharmaceutical Price Monitor",
  breakpoint_system = breakpoint_system,
  style = "padding:1em;",
  # fill_page = FALSE,
  # auto_fill = FALSE,

  rows = list(
    default = ".25fr 1fr 1fr",
    md = "auto auto auto auto auto "
  ),
  # columns = c(default =  "1fr 1.25fr 1.25fr"),
  areas = list(
    default = c(
      "header_cards  header_cards",
      "overview  demographics",
      "overview   survey_recent"
    ),

    md = c(
      "header_cards  header_cards",
      "overview  overview",
      "demographics demographics",
      "survey_recent survey_recent"
    )


    # md = c(
    #   "header_cards header_cards header_cards header_cards",
    #   "sales sales sales sales ",
    #   "sales_splits sales_splits top_products top_products",
    #   "top top top_clients top_clients",
    #   "category category category category "
    # )
  ),
  gap = list(
    default = "15px",
    md = "10px",
    sm = "15px"
  ),

    div(
        class = "header_cards",
        style = 'display: flex;
        justify-content: space-between;
        align-items: center;
            background: transparent;',
        h1("HR ATTRITION DASHBOARD"),
        div(
          class = 'logo_img',
          style  ='display: flex;
    align-items: center;',
          materialSwitch(
            inputId = "Id076",
            label = "A label",
            right = TRUE
          ),
          tags$img(src = 'img/logo_data_vz.png', width = '108px', height = '78px')
        )),

# -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - --

    div(class = "overview",
        style  ="height: 100%;",
        h5("OVERVIEW", style = 'display: inline;'),
        tags$span("(27 de maio, 2021 to 8 maio, 2022)",
                  style  ='color:gray;font-size: .75em;float: right;'),

        tags$ul(style  ='display: flex; gap: 2em; justify-content: space-between;',
                tags$li(tags$img(src = 'img/attrition_rate.png', "16.1%", width = '24px', style = 'gap: 2em; justify-content: space-between;')),
                tags$li(tags$img(src = 'img/attrition_rate.png', "237", width = '24px', style = 'gap: 2em; justify-content: space-between;')),
                tags$li(tags$img(src = 'img/attrition_rate.png', "1,233", width = '24px', style = ''))
        ),

        tags$ul(style  ='display: flex; gap: 2em; justify-content: space-between;border-bottom: .05em solid lightgray;padding-bottom:1em;',
                tags$li(tags$span('ATTRITION', br(),'RATE' )),
                tags$li(tags$span('TOTAL', br(),'ATTRITION' )),
                tags$li(tags$span('CURRENT', br(),'EMPLOYEE' ))
        ),

        div(
          class = 'department',
          style = 'display: flex;justify-content: space-between;border-bottom: .05em solid lightgray;
          padding-bottom:1em;    gap: 1em;',
          h5("DEPARTMENT", style = 'margin:0px;display: inline; background: lightgray; width: 100%;'),


          div(class="vertical-line",
          style = 'border-left: 1px solid lightgray;  height: 300px; '),

          div( class = 'jobrole_input',
               style = 'background: lightgray; width: 100%;',
            h5("JOB ROLE", style = 'display: inline;'),

            pickerInput(
              inputId = "Id086",
              inline = TRUE,
              label = NULL,width = '100px',
              choices = c("a", "b", "c", "d")

            ))
          ),
        div(
          class = "attrition_trend",
          style  ="border-bottom: .05em solid lightgray;padding-bottom:1em;",
          div( class = 'jobrole_input',
               style = 'display: flex; justify-content: space-between;align-items: center;',
               h5("ATTRITION TREND", style = 'display: inline;'),

               checkboxGroupButtons(
                 inputId = "Id051",
                 direction = 'horizontal',
                 size = 'xs',
                 label = "Label",
                 choices = c("A",
                             "B", "C", "D"),
                 selected = c("B", "D")
               )

          ),
          div(class = 'chart',
              style = 'height:250px;background: lightgray;',
              h1('Gráfico'))
        )),
# -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - --
    # div(
    #   class = "attrition_trend",
    #   style  ="height: 100%;",
    #   h4("ATTRITION TREND", style = 'display: inline;'),
    #   tags$span("(27 de maio, 2021 to 8 maio, 2022)",
    #             style  ='color:gray;font-size: .75em;float: right;')
    #   ),
# -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - --
    div(class = "demographics",
        style  ="height: 100%;",
        h5("DEMOGRAPHICS", style = 'display: inline;'),
        tags$span("(Click data points to filter dashboard.)",
                  style  ='color: gray;font-size: .75em;float: right;'),
        tags$div(
          class = 'charts_area',
          style = 'display:flex;gap:1em ;
            justify-content: space-between;',
          div(
            style = 'flex:1;background: lightgray;',
            h6("GENDER",),

          ),

          div(class="vertical-line",
              style = 'border-left: 1px solid lightgray;  height: 300px;margin-top : 2em;'),

          div(style = 'flex:1;background: lightgray;',
            h5("AGE GROUP",)
          ),

          div(class="vertical-line",
              style = 'border-left: 1px solid lightgray;  height: 300px;margin-top : 2em;'),

          div(style = 'flex:1; background: lightgray;display: flex;',

            h5("EDUCATION", style = 'display: inline-block;'),
            sliderInput(inputId = 'slider',
                        label = NULL,min = 0,
                        width = '150px',

                        ticks = FALSE,
                        max = 1,value = .5)


          )
        )



        ),
# -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - --
div(class = 'survey_recent',
    style = 'display: flex;width: 100%;gap:1em;',
div(h5("SURVEY SCORE"),
        class = "survey",
        style  ="height: 100%;flex:1;",

    div(
      class = 'table',
      h1('Table',style = 'background: lightgray;height: 300px')
    )),
# -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - --
    div(
        class = "recent",
        style  ="height: 400px;",
        h5("RECENT ATTRITION"),

        div(
          class = 'inputs',
          style = 'display:flex;justify-content: space-between;',
          checkboxGroupButtons(
            inputId = "Id051",
            direction = 'horizontal',
            size = 'xs',
            label = "Label",
            choices = c("A",
                        "B", "C", "D"),
            selected = c("B", "D")
          ),
          checkboxGroupButtons(
            inputId = "Id051",
            direction = 'horizontal',
            size = 'xs',
            label = "Label",
            choices = c("A",
                        "B", "C", "D"),
            selected = c("B", "D")
          )
        ),

        div(
          class = 'scroll_dates',
          style = 'height: 250px;overflow-y: scroll;',
          div(
            class = 'infos',
            style = 'height: fit-content;',
            h1('Text1'),
            h1('Text1'),
            h1('Text1'),
            h1('Text1'),
            h1('Text1'),
            h1('Text1'),
            h1('Text1'),
            h1('Text1'),
            h1('Text1'),
            h1('Text1')


              # pmap(list(x = vector,y = techProfessions,z = technologyAreas),
              #      ~ cards_function(num = ..1,job = ..2,  area = ..3,day = 8 ,c(1,2,3)))
            )


        )),


)

)

server <- function(input, output, session) {



}

options(shiny.autoreload = TRUE)


shinyApp(ui = ui, server = server)
