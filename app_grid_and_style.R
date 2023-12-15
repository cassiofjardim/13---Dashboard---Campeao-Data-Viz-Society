library(shiny)
library(shinyWidgets)
library(imola)
library(tidyverse)
library(highcharter)
library(reactable)



# https://public.tableau.com/app/profile/pradeepkumar.g/viz/HRAttritionDashboardRWFD_16570446563570/viz
breakpoint_system <- getBreakpointSystem()
#
breakpoint_system <- addBreakpoint(
  breakpoint_system,
  breakpoint("md", max = 1200)

)
#
breakpoint_system <- addBreakpoint(
  breakpoint_system,
  breakpoint("xs", max = 991)

)

# #FFB67A
# #484848
# #959595

ui <- gridPage(
  tags$style(
    "

     body{


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


  @import url('https://fonts.googleapis.com/css2?family=Lumanosimo&display=swap');

    @import url('https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
    *{

    font-family: 'Exo 2', sans-serif;
    }



    ul{
    list-style: none;
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

    .overview h5,
    .demographics h5{
        margin-bottom: 2rem;
    }


    h5{
      font-size: 1.15rem;
      font-weight: 600;
      letter-spacing: .35em;
    }

    .material-switch label:after {
        background: #fff;
        border-radius: 1pc;
        box-shadow: 0 0 5px rgba(0,0,0,.3);
        content: '';
        height: 12px ;
        left: 3px;
        margin-top: -8px;
        position: absolute;
        top: 2px;
        transition: all .3s ease-in-out;
        width:12px ;
    }

  /*Job Role Input*/



/*Attrition Trend Input*/
/* Attrition Trend começando...*/

div#attrition_tred_input div,
#recent_attrition_input_1 div,
#recent_attrition_input_2 div
{
    margin-right: 0.51rem;
}

div#attrition_tred_input button.btn.checkbtn.btn-default,
div#recent_attrition_input_1 button.btn.checkbtn.btn-default,
div#recent_attrition_input_2 button.btn.checkbtn.btn-default
{
    border-radius: 0 !important;

}

div#recent_attrition_input_1 .btn.checkbtn.btn-default.active,
div#recent_attrition_input_2 .btn.checkbtn.btn-default.active,
div#attrition_tred_input .btn.checkbtn.btn-default.active{

background:#484848;
    color: white

}

/* Slider Input Customização: no arquivo de produção trato os inputs select */

.irs--shiny .irs-bar{
    border-top: 1px solid #FFB67A;
    border-bottom: 1px solid #FFB67A;
    background: #FFB67A;
}

.irs--shiny .irs-handle{
    top: 22px;

    width: 12px;
    height: 12px

}

.irs--shiny .irs-from,
.irs--shiny .irs-to,
.irs--shiny .irs-single{

    background-color: #484848;

}

/*************************/

.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
    overflow-y: scroll;
    height: 500px;
}

.survey {
    /*height: 400px !important;*/
    /*overflow-y: scroll;*/
}


.recent, .survey{
  flex: 1;
}

  @media only screen and (max-width: 1200px) {
  .survey_recent{
    flex-direction: column;
  }
 }

  @media only screen and (max-width: 991px) {
  .survey_recent{
     flex-direction: row;
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

    default = c("100px .5fr auto"),
    md = c("100px auto auto "),
    xs = c("100px auto auto auto")
  ),
  columns = c(default =  "auto auto ",
              md =  "1fr 1fr ",
              xs =  "1fr"

  ),
  areas = list(
    default = c(

      "header_cards header_cards",
      "overview     demographics",
      "overview     survey_recent"

    ),

    md = c(
      "header_cards  header_cards",
      "overview      survey_recent",
      "demographics demographics"

    ),

    xs = c(
      "header_cards  ",
      "overview  ",
      "demographics",
      "survey_recent"
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
        align-items: center;height: 100px;
            background: transparent;',
    h1("HR ATTRITION DASHBOARD", style = 'font-family: monospace;'),
    div(
      class = 'logo_img',
      style  ='display: flex;
    align-items: center;',
      div(
        h6("SHOW ONLY ATTRITION", style = 'font-size:1rem; color: #121212;'),
        materialSwitch(
          inputId = "dash_toggle",
          label = ""
        )
      ),
      div(
        class = 'img_legends',
        tags$img(src = 'img/logo_data_vz.png',
                 width = '108px', height = '78px', style = 'display: inline-block;'),
        tags$ul(
          class = 'main_legends',
          style = 'display: flex;list-style: none; margin: 1rem 0;padding: 0;',
          tags$li(style = 'margin-right: 2rem;display:flex;align-items: baseline;',
                  tags$span(style = 'padding-right: 1rem;width: 10px; height: 10px;border-radius:50%;display: block;
        background: #FFB67A;'),
                  p('RETENTION', style = 'color: black;margin-left: 0.75rem;font-size: 1rem;font-weight: 500;'),
          ),
          tags$li(style = 'display:flex;align-items: baseline;',
                  tags$span(style = 'padding-right: 1rem;width: 10px; height: 10px;border-radius:50%;display: block;
        background: #484848;;'),
                  p('ATTRITION', style = 'color: black;
    margin-left: 0.75rem; font-size: 1rem;  font-weight: 500;')))))),

  # -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - --

  div(class = "overview",
      style  ="",
      h5("OVERVIEW", style = 'display: inline-block; '),
      tags$span("(27 de maio, 2021 to 8 maio, 2022)",
                style  ='color:gray;font-size: .75em;'),

      div(
        class = 'numbers_overview',
        style = 'margin: 0 2rem;',

        tags$ul(class = 'headers',style  ='display: flex; gap: 2em; justify-content: space-around;',
                tags$li(style = 'display: flex; align-items: center;',tags$img(src = 'img/attrition_rate.png', tags$span("16.1%",style = 'color: black;font-weight: 100; font-size: 1.85rem;margin-left: 1rem;'), width = '24px', style = 'gap: 2em; justify-content: space-between;')),
                tags$li(style = 'display: flex; align-items: center;',tags$img(src = 'img/attrition_rate.png', tags$span("237",style = 'color: black;font-weight: 100; font-size: 1.85rem;margin-left: 1rem;'),   width = '24px', style = 'gap: 2em; justify-content: space-between;')),
                tags$li(style = 'display: flex; align-items: center;',tags$img(src = 'img/attrition_rate.png', tags$span("1,233",style = 'color: black;font-weight: 100; font-size: 1.85rem;margin-left: 1rem;'), width = '24px', style = ''))
        ),

        tags$ul(style  ='display: flex; gap: 2em; justify-content: space-around;border-bottom: .05em solid lightgray;padding-bottom:1em;',
                tags$li(tags$span('ATTRITION', br(),'RATE' , style = 'display: inline; color: #808080a8; font-size: .65em; float: right; font-weight: 500;')),
                tags$li(tags$span('TOTAL', br(),'ATTRITION', style = 'display: inline; color: #808080a8; font-size: .65em; float: right; font-weight: 500;')),
                tags$li(tags$span('CURRENT', br(),'EMPLOYEE' , style = 'display: inline; color: #808080a8; font-size: .65em; float: right; font-weight: 500;')))



      ) ,

      div(
        style = '    display: flex; justify-content: space-between; align-items: center;',
        h5("DEPARTMENT"),
        div(
          class = 'title_input',
          style = '',
          h5("JOB ROLE",
             style = 'display: inline;margin-right: 10rem;'),

          pickerInput(
            inputId = "job_role_input",
            inline = TRUE,
            label = NULL,
            width = '100px',

            choices = c("Top 5", "Top 10", "Top 15")

          ))
      ),

      div(
        class = 'department_jobrole',
        style = 'display: flex;justify-content: space-evenly;border-bottom: .05em solid lightgray;
          padding:0 0rem;margin-bottom: 1em;gap: 1em;height: 350px',

        tags$ul(
          class = 'donut_charts',
          style = 'padding: 0;list-style : none;margin-top: 2rem; flex: .5;',
          tags$li(style = 'display: flex;',tags$span("R & D", style = 'flex-basis: 100px; color: #484848;font-size: 1rem;'),
                  highchartOutput(outputId = 'department_donut_chart_1', height = '100px', width = '150px')),
          tags$li(style = 'display: flex;',tags$span("SALES", style = 'flex-basis: 100px; color: #484848;font-size: 1rem;'),
                  highchartOutput(outputId = 'department_donut_chart_2', height = '100px', width = '150px') ),
          tags$li(style = 'display: flex;',tags$span("HR", style = 'flex-basis: 100px; color: #484848;font-size: 1rem;'),
                  highchartOutput(outputId = 'department_donut_chart_3', height = '100px', width = '150px'))

        ),

        div(class="vertical-line",
            style = 'border-left: 1px solid lightgray;  height: 300px; '),

        div(
          class = 'jobrole_table_div',
          style = '    height: 320px; overflow-y: scroll; flex: .5;',
          div( class = 'jobrole_input',
               style = 'background: ; width: 100%; '),
          reactableOutput(outputId = 'job_role')),


      ),
      div(
        class = "attrition_trend",
        style  ="padding-bottom:1em;",
        div( class = 'jobrole_input',
             style = 'display: flex; justify-content: space-between;align-items: center;',
             h5("ATTRITION TREND", style = 'display: inline;'),
             checkboxGroupButtons(
               inputId = "attrition_tred_input",
               direction = 'horizontal',
               size = 'xs',
               label = "Quarters",

               choiceNames = c("1st","2nd", "3rd", "4th"),
               selected = 1,
               choiceValues = c(1,2,3,4)) ),
        p('^ 85.5%', style = 'display: inline; color: black;font-weight: 600;font-size: 1.5rem; padding: 1rem 0;'),
        tags$span(' vs previous month', style = '    font-size: 1.05rem;color: #00000094;'),

        div(class = 'chart',
            # style = 'height:250px;background: lightgray;',
            highchartOutput(outputId = 'attrition_trend_plot', height = '250px'))
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
      style  ="padding-bottom: 0rem; height: ;",
      h5("DEMOGRAPHICS",
         style = 'display: inline;'),
      tags$span("(Click data points to filter dashboard.)",
                style  ='color: gray;font-size: .75em;float: right;'),
      tags$div(
        class = 'charts_area',
        style = 'display:flex;gap:1em ;
            justify-content: space-between;margin-top: 2rem;',
        div(
          style = 'flex:1;',
          h6("GENDER"),
          tags$ul(
            class = 'donut_charts',
            style = 'list-style: none; margin: 0; padding: 0;',
            tags$li(style = 'display: flex; align-items: center;',
                    tags$span("MALE", style = ' color: #484848;font-size: 1rem;'),
                    highchartOutput(outputId = 'department_donut_chart_4', height = '100px')),
            tags$li(style = 'display: flex;align-items: center;',
                    tags$span("FEMALE", style = ' color: #484848;font-size: 1rem;'),
                    highchartOutput(outputId = 'department_donut_chart_5', height = '100px')),




          )

        ),

        div(class="vertical-line",
            style = 'border-left: 1px solid lightgray;  height: 250px;margin-top : 2em;'),

        div(style = 'flex:1;',
            h5("AGE GROUP"),
            highchartOutput(outputId = 'age_group', height = '250px')
        ),

        div(class="vertical-line",
            style = 'border-left: 1px solid lightgray;  height: 250px;margin-top : 2em;'),

        div(
          div(style = 'flex:1;display: flex; width : 250px',

              h5("EDUCATION", style = '    display: inline-block;
    margin-right: 1rem;'),
              sliderInput(inputId = 'slider',
                          label = NULL,min = 0,
                          width = '150px',

                          ticks = FALSE,
                          max = 1,value = .5)),

          highchartOutput(outputId = 'education',  height = '250px')))
  ),
  # -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - --
  div(class = 'survey_recent',
      style = 'display: flex;width: 100%;gap:1em;',
      div(h5("SURVEY SCORE",
             tags$img(src = 'img/exclamation.png', width = '18px', height = '18px', style = 'float: right;')),

          class = "survey",
          style  ="",

          div(
            class = 'table',
            reactableOutput(outputId = 'survey_score', width = 'auto')
          )),
      # -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - -- -  - --
      div(
        class = "recent",
        style  = '',
        h5("RECENT ATTRITION"),

        div(
          class = 'inputs',
          style = 'display:flex;justify-content: space-between;',
          pickerInput(
            inputId = "recent_attrition_input_1",
            inline = TRUE,
            label = NULL,
            width = '100px',

            choices = c("Top 5", "Top 10", "Top 15")

          ),
          pickerInput(
            inputId = "recent_attrition_input_2",
            inline = TRUE,
            label = NULL,
            width = '100px',

            choices = c("Top 5", "Top 10", "Top 15")

          )

        ),

        div(
          class = 'scroll_dates',
          style = '   height: 450px;
    overflow-y: scroll;',
          div(
            class = 'infos',
            style = 'height: fit-content;',
            uiOutput(outputId = 'cards')

          ))),


  )

)

server <- function(input, output, session) {

  }





options(shiny.autoreload = TRUE)


shinyApp(ui = ui, server = server)
