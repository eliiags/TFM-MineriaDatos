##################################
##### TFM - Mineria de Datos #####
#####                        #####
#####  Elianni AGüero Selva  #####
##################################

library(dplyr)
library(writexl)
library(tidyverse)
library(stringr)
library(glmnet)
library(sas7bdat)
library(caret)
library(lmSupport)

#Definimos la funcion %ni%
`%ni%` <- Negate(`%in%`)


# Lee los ficheros txt y devuelve un data.frame
leer_tabla <- function(fichero) {
    fich_tabla <- read.table(file =  fichero,
                             header =  TRUE,
                             sep =  "|",
                             na.strings =  "",
                             stringsAsFactors =  FALSE, 
                             comment.char =  "",
                             quote =  "\"",
                             fill =  FALSE,
                             nrows =  20000000)
    return(fich_tabla)
}



#################
#### STUDIES ####
#################
studies  <- leer_tabla("studies.txt")
estudios <- studies

# Convertimos la variable start_date en tipo fecha
estudios$start_date      <- as.Date(estudios$start_date)
# Pasamos los string a minuscula
estudios$phase           <- tolower(estudios$phase)
estudios$overall_status  <- tolower(estudios$overall_status)
estudios$enrollment_type <- tolower(estudios$enrollment_type)        
estudios$has_dmc         <- tolower(estudios$has_dmc)        

# Seleccionamos los estudios que esten en: 
#   - Fase 3 y 4
#   - Estudios a partir del 2005
estudios <- filter(estudios, estudios$phase %in% c("phase 3", "phase 4") 
                   & estudios$start_date > "2005-01-01" 
                   & estudios$overall_status %in% c("completed", "terminated"))


# Seleccionamos las variables que queremos
estudios <- select(estudios, nct_id, start_date, study_type, overall_status, phase, 
                   enrollment, enrollment_type, number_of_arms, has_dmc)


# Tomamos la decision de eliminar study_type ya que solo tiene un valor
# Tambien eliminamos start_date porque no es objeto de estudio
estudios <- select(estudios, nct_id, overall_status, phase, enrollment, 
                   enrollment_type, number_of_arms, has_dmc)




#################
#### DESIGNS ####
#################
designs <- leer_tabla("designs.txt")
disenno <- designs

# Seleccionamos las variables que nos interesan
disenno <- select(disenno, nct_id, allocation, primary_purpose, masking, 
                  intervention_model)

# pasamos todo a minusculas
disenno$allocation         <- tolower(disenno$allocation) 
disenno$primary_purpose    <- tolower(disenno$primary_purpose) 
disenno$masking            <- tolower(disenno$masking) 
disenno$intervention_model <- tolower(disenno$intervention_model) 


### Unimos la tabla con clinical ###
clinical <- inner_join(estudios, disenno, by = "nct_id")
clinical <- distinct(clinical)

# Contiene los identificadores de los ensayos
id <- select(clinical, nct_id)



#######################
#### ELIGIBILITIES ####
#######################
eligibilities <- leer_tabla("eligibilities.txt")
criterio      <- eligibilities

# Seleccionamos las variables
criterio      <- select(criterio, nct_id, gender, minimum_age, maximum_age, 
                        healthy_volunteers)

# pasamos a minusculas
criterio$gender             <- tolower(criterio$gender)
criterio$minimum_age        <- tolower(criterio$minimum_age)
criterio$maximum_age        <- tolower(criterio$maximum_age)
criterio$healthy_volunteers <- tolower(criterio$healthy_volunteers)

# selecionamos los estudios que nos han quedado en la fase anterior
criterio      <- inner_join(id, criterio, by = "nct_id")

# Tratamiento de las variables min y max, pasamos todos los valores a dias
for (j in 3:4) {
    for (i in 1:NROW(criterio)) {
        aux <- str_split(criterio[i,j], " ", simplify = TRUE)
        if (length(aux) == 2){
            n <- as.double(aux[1])
            if (aux[2] == "minutes" | aux[2] == "minute") {
                criterio[i,j] <- (n / 1) * (1 / 60) * (1 / 24)
            } else if (aux[2] == "hours"  | aux[2] == "hour") {
                criterio[i,j] <- (n / 24)
            } else if (aux[2] == "weeks"  | aux[2] == "week" ) {
                criterio[i,j] <- (n * 7)
            } else if (aux[2] == "days"   | aux[2] == "day") {
                criterio[i,j] <- n
            } else if (aux[2] == "months" | aux[2] == "month") {
                criterio[i,j] <- (n * 30.417)
            } else if (aux[2] == "years"  | aux[2] == "year") {
                criterio[i,j] <- (n * 365)
            }
        } else {
            criterio[i,j] <- NA
        }
    }
}

# conversión a double
criterio$minimum_age <- as.double(criterio$minimum_age)
criterio$maximum_age <- as.double(criterio$maximum_age)


# unimos a la tabla clinical
clinical <- inner_join(clinical, criterio, by = "nct_id")





##################
#### SPONSORS ####
##################
sponsors   <- leer_tabla("sponsors.txt")
directores <- sponsors

# contamos el número de colaboradores del estudio
aux <- directores %>% 
    group_by(nct_id) %>%
    summarise(n_collaborators=n()-1)
# annadimos la variable a la tabla
directores <- inner_join(aux, directores)

# Eliminamos los colaboradores
directores <- filter(directores, lead_or_collaborator %in% c("lead"))
# Cambiamos nombre name por sponsors
directores <- select(directores, nct_id, n_collaborators, agency_class)

# pasamos a minusculas
directores$agency_class <- tolower(directores$agency_class)


### Unimos la tabla con clinical ###
clinical <- inner_join(clinical, directores, by = "nct_id")





###################
#### COUNTRIES ####
###################
countries <- leer_tabla("countries.txt")
paises <- countries
# Eliminamos los paises que han sido eliminados del estudio
paises <- filter(paises, removed %ni% c("t"))
# Seleccionamos solo las variables
paises <- inner_join(id, paises)
# Creamos el nombre de countries y region
paises <- select(paises, nct_id, region = name, countries = name)

paises$countries <- as.factor(paises$countries)
summary(paises$countries)

# tratamiento para clasificar variables en regiones
j <- 2
aux <- paises[,j]
for (i in 1:NROW(paises)) {
    if (aux[i] %in% c("Angola", "Burkina Faso", "Burundi", "Benin", "Botswana", "Africa", "Congo, The Democratic Republic of the", "Central African Republic", 
                      "Congo", "Côte D'Ivoire", "CÃ´te D'Ivoire", "Cameroon", "Cape Verde", "Western Sahara", "Eritrea", "Ethiopia", "Gabon", "Ghana", "Gambia", 
                      "Guinea", "Equatorial Guinea", "Guinea-Bissau", "Kenya", "Liberia", "Lesotho", "Madagascar", "Mali", "Mauritius", "Malawi", "Mozambique", 
                      "Namibia", "Niger", "Nigeria", "Rwanda", "Seychelles", "South Sudan", "Saint Helena", "Sierra Leone", "Senegal", "Sao Tome and Principe", 
                      "Swaziland", "Chad", "Togo", "Tanzania, United Republic of", "Tanzania", "Uganda", "Mayotte", "South Africa", "Zambia", "Zimbabwe")) {
        paises[i,j] <- "africa"
    } 
    else if (aux[i] %in% c("Bahrain", "Djibouti", "Algeria", "Comoros", "Morocco", "Mauritania", "Palestinian Territory", "Sudan", "Somalia", "Tunisia")) {
        paises[i,j] <- "arab_states"
    } 
    else if (aux[i] %in% c("Afghanistan", "Antarctica", "American Samoa", "Australia", "Azerbaijan", "Bangladesh", "Brunei Darussalam", "Bhutan", 
                           "Cocos (Keeling) Islands", "Cook Islands", "China", "Christmas Island", "Fiji", "Micronesia, Federated States of", "Guam", 
                           "Hong Kong", "Heard Island and McDonald Islands", "Indonesia", "India", "British Indian Ocean Territory", "Japan", "Kyrgyzstan", 
                           "Cambodia", "Kiribati", "Korea, Democratic People's Republic of", "Korea, Republic of", "Kazakhstan", 
                           "Lao People's Democratic Republic", "Sri Lanka", "Marshall Islands", "Myanmar", "Mongolia", "Macau", "Northern Mariana Islands", 
                           "Maldives", "Malaysia", "New Caledonia", "Norfolk Island", "Nepal", "Nauru", "Niue", "New Zealand", "French Polynesia", 
                           "Papua New Guinea", "Philippines", "Pakistan", "Pitcairn Islands", "Palau", "Reunion", "Solomon Islands", "Singapore", 
                           "Syrian Arab Republic", "French Southern Territories", "Thailand", "Tajikistan", "Tokelau", "Turkmenistan", "Tonga", "Timor-Leste", 
                           "Tuvalu", "Taiwan", "United States Minor Outlying Islands", "Uzbekistan", "Vietnam", "Vanuatu", "Wallis and Futuna", "Samoa")) {
        paises[i,j] <- "asia_pacific"
    } 
    else if (aux[i] %in% c("Andorra", "Albania", "Armenia", "Austria", "Bosnia and Herzegovina", "Belgium", "Bulgaria", "Belarus", "Switzerland", "Cyprus", 
                           "Czech Republic", "Czechia", "Germany", "Denmark", "Estonia", "Spain", "Finland", "Faroe Islands", "France", "France, Metropolitan", 
                           "United Kingdom", "Georgia", "Gibraltar", "Greenland", "Greece", "Croatia", "Hungary", "Ireland", "Israel", "Iceland", "Italy", 
                           "Liechtenstein", "Lithuania", "Luxembourg", "Latvia", "Monaco", "Moldova, Republic of", "Macedonia", "North Macedonia", "Jersey",
                           "Macedonia, The Former Yugoslav Republic of", "Malta", "Netherlands", "Norway", "Poland", "Portugal", "RÃ©union", "Romania", 
                           "Russian Federation", "Sweden", "Slovenia", "Svalbard and Jan Mayen", "Slovakia", "San Marino", "Turkey", "Ukraine", 
                           "Holy See (Vatican City State)", "Serbia", "Former Serbia and Montenegro", "Montenegro", "Aland Islands", "Guernsey", "Isle of Man")) {
        paises[i,j] <- "europe"
    } 
    else if (aux[i] %in% c("United Arab Emirates", "Egypt", "Iraq", "Iran, Islamic Republic of", "Jordan", "Kuwait", "Lebanon", "Libya", "Oman", "Qatar", 
                           "Saudi Arabia", "Yemen" )) {
        paises[i,j] <- "middle_east"
    } 
    else if (aux[i] %in% c("Bermuda", "Canada", "Saint Pierre and Miquelon", "United States", "Virgin Islands (U.S.)")) {
        paises[i,j] <- "north_america"
    }
    else if (aux[i] %in% c("Antigua and Barbuda", "Anguilla", "Netherlands Antilles", "Argentina", "Aruba", "Barbados", "Bolivia", "Brazil", "Bahamas", 
                           "Bouvet Island", "Belize", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominica", "Dominican Republic", "Ecuador", 
                           "Falkland Islands (Malvinas)", "Grenada", "French Guiana", "Guadeloupe", "South Georgia and the South Sandwich Islands", "Guatemala", 
                           "Guyana", "Honduras", "Haiti", "Jamaica", "Saint Kitts and Nevis", "Cayman Islands", "Saint Lucia", "Martinique", "Montserrat", 
                           "Mexico", "Nicaragua", "Panama", "Peru", "Puerto Rico", "Paraguay", "Suriname", "El Salvador", "Turks and Caicos Islands", 
                           "Trinidad and Tobago", "Uruguay", "Saint Vincent and the Grenadines", "Venezuela", "Virgin Islands, British", "Virgin Islands, U.S.",
                           "Saint Barthelemy", "Saint Martin" )) {
        paises[i,j] <- "south_latin_america"
    }
}

# número de paises en los que se ha desarrollado el ensayo
paises <- paises %>% 
    group_by(nct_id, region) %>%
    summarise(n_countries=n())

# unimos con la tabla clinical
clinical <- inner_join(clinical, paises, by="nct_id")
clinical <- distinct(clinical)


# Tenemos hasta paises
clinical_aux <- clinical
clinical_aux <- distinct(clinical_aux)


######################################
#### INTERVENCIONES & CONDICIONES ####
######################################

# INTERVENCIONES #
interventions  <- leer_tabla("interventions.txt")
intervenciones <- interventions
intervenciones <- inner_join(id, intervenciones)
# seleccionamos las variables
intervenciones <- select(intervenciones, nct_id, intervention_type)
intervenciones <- distinct(intervenciones)

intervenciones$intervention_type <- tolower(intervenciones$intervention_type)

# seleccionamos solo las id
clinical_aux <- inner_join(clinical_aux, intervenciones, by = "nct_id")


# Hacemos la particion de datos
set.seed(63226)
partitionIndex <- createDataPartition(clinical_aux$overall_status, p=0.889889, list=FALSE)
data_train <- clinical_aux[partitionIndex,]
data_test  <- clinical_aux[-partitionIndex,]

write_xlsx(data_test, "NCT.xlsx")
