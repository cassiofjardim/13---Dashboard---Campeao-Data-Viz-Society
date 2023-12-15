library(shiny)
library(shinyWidgets)
library(imola)
library(tidyverse)
library(highcharter)
library(reactable)
vector <- 780:799
techProfessions <- c("software engineer", "data scientist", "web developer", "cybersecurity analyst",
                     "network administrator", "database administrator",
                     "artificial intelligence engineer", "IT project manager",
                     "UX/UI designer", "cloud architect", "machine learning engineer",
                     "computer systems analyst", "game developer", "IT consultant",
                     "blockchain developer", "DevOps engineer", "data analyst",
                     "information security analyst", "mobile app developer",
                     "systems engineer")

numbers <- 1:20

techProfessions<- str_to_title(techProfessions)

techProfessions <- paste0(numbers,"      ",techProfessions)

department <- sample(c('R&D','Sales','HR'),20,TRUE)


# Vetor com nomes masculinos
# Vetor com nomes masculinos
nomesMasculinos <- c("João", "Pedro", "Carlos", "Lucas", "André", "Miguel", "Rafael",
                     "Gustavo", "Bruno", "Leonardo")

# Vetor com nomes femininos
nomesFemininos <- c("Maria", "Ana", "Mariana", "Carolina", "Laura",

                    "Gabriela", "Camila", "Isabela", "Larissa", "Natália")

nomes_h_m <- c(nomesMasculinos, nomesFemininos)
h_m <- c(rep('homem',10),rep('mulher',10))


idades <- sample(20:60, 20, replace = TRUE)

# Adicionando uma coluna "Idade" ao dataframe existente

# Vetor com os níveis de educação
niveisEducacao <- c("Graduação", "Mestrado", "PhD", "Ensino Médio","Prof Associado",
                    "Graduação", "Mestrado", "PhD", "Ensino Médio","Prof Associado",
                    "Graduação", "Mestrado", "PhD", "Ensino Médio","Prof Associado",
                    "Graduação", "Mestrado", "PhD", "Ensino Médio","Prof Associado"
)


opinions <- c("Environment Satisfaction", "Job Satisfaction", "Job Involvement", "Relationship Satisfaction","Work Life Balance",
              "Environment Satisfaction", "Job Satisfaction", "Job Involvement", "Relationship Satisfaction","Work Life Balance",
              "Environment Satisfaction", "Job Satisfaction", "Job Involvement", "Relationship Satisfaction","Work Life Balance",
              "Environment Satisfaction", "Job Satisfaction", "Job Involvement", "Relationship Satisfaction","Work Life Balance")

att_ret <- sample(c('Attrition','Retention'),20, replace = TRUE)

months_21 <- c(paste0(month.abb,' ','2021'))
months_22 <- c(paste0(month.abb[1:8],' ','2022'))

my_data <- data_frame(vector, techProfessions,  department, nomes_h_m,h_m, niveisEducacao,opinions,att_ret, idades) %>%
   mutate(idades_age_interval = as.factor(
    case_when(
      idades < 25 ~ '< 25',
      idades >= 25 & idades <= 34 ~ '25 - 34',
      idades > 34 & idades <= 44 ~ '34 - 44',
      idades > 44 & idades <= 55 ~ '45 - 54',
      idades > 55  ~ '>55'
    )
  ), dates = c(months_21,months_22)) %>%

  mutate(dates_months = c(month.abb,month.abb[1:8]) ,
         index = c(rep(c(1:4),5)),
         quarters = case_when(index == 1 ~ 'First Quarter',
                              index == 2 ~ 'Second Quarter',
                              index == 3 ~ 'Third Quarter',
                              index == 4 ~ 'Fourth Quarter'
         ))




#********** Department ***********


department_numbers <- my_data %>%
  group_by(department,h_m) %>%
  count() %>%
  mutate(color = case_when(
    h_m == 'homem' ~ '#484848',
    TRUE ~ '#FFB67A'),
    y = n)


female_male <- department_numbers %>% group_by(h_m) %>% summarise(y = sum(n))


#********** Job Role ***********


# HR

#*** Attrition Trend ********
#*
#*# 21


#*** Age Group

age_group_data <- my_data
#
#
# prof_n <- data %>% mutate(n_roles = as.integer(2.8*Idade)) %>%
#             select(techProfessions, Idade, n_roles)
#
# nivel_h_m <- data %>%
#   group_by(`Nível de Educação`) %>%
#   count(Gênero) %>%
#   pivot_wider(names_from = `Gênero`,values_from = n)
#
#
# idade_h_m <- data %>%
#   group_by(Idade) %>%
#   count(Gênero) %>%
#   pivot_wider(names_from = `Gênero`,values_from = n) %>%
#   mutate(mulher = replace_na(mulher,0), homem = replace_na(homem,0))
#
#
#
