


cards_function <- function(num,job,area,day,info_vector){

  tagList(
    div(
      class = 'card',
      style = 'display: flex;
    font-size: .8em;
    border-top: 1px solid #d3d3d359;
    margin: 0 1em;
    padding: 0.5em;',

      div(class = 'left_col',
          tags$ul(
            style = 'list-style: none;
            background-image: radial-gradient(#f1c23c2e 70%, transparent 20%, #fa807200 40%);
    /* border: 2px solid; */
    /* border-radius: 50%; */
    height: fit-content;
    width: fit-content;
    list-style: none;
    /* height: 100px; */
    padding: 15px 30px;
    margin-left: 3em;
    border-left: 2px solid orange;',
            tags$li(paste0('E_',num), style  ='font-weight: 700;font-size: 1.25rem;'),
            tags$li(paste0(job), style  ='    font-weight: 400;
    font-style: italic;
    font-size: 1.25rem;
    color: gray;'),
            tags$li(paste0(area), style  ='font-style: italic;
    font-weight: 600;
    color: gray;')

          )),
      div(class = 'right_col',
          style = '    flex: 1;
              width: fit-content;
    text-align: right;',
          tags$ul(
            style = 'color: #FFB67A; font-style: italic;font-weight: 600;',
            paste0('Attrition date:',day,' May, 2022'),
            tags$li(paste0('Avg Satisfaction: ',paste0(day)), style = 'color: gray;font-style: normal;font-weight: normal;'),
            tags$li(paste0('Performance Rating: ',info_vector[1]), style = 'color: gray;font-style: normal;font-weight: normal;'),
            tags$li(paste0('Monthly Income: ',info_vector[2]), style = 'color: gray;font-style: normal;font-weight: normal;'),
            tags$li(paste0('Salary Hike: ',info_vector[3]), style = 'color: gray;font-style: normal;font-weight: normal;')


          ))



    )

  )


}
