setwd("C:\\Users\\davic\\OneDrive\\Documentos\\R\\data")
#Colocando o caminho para o arquivo

data2 <- read.csv("data_RAW.csv", header = TRUE, sep=";", dec = ".") #Lendo o arquivo

#Checagem se esta com o conteudo certo
colnames(data2)
ncol(data2)
nrow(data2)

df <- data.frame(data2) #Criando o DataFrame

#Deletando as colunas que não serão usadas
df$GDP <- NULL
df$Inflation.rate <- NULL
df$Unemployment.rate <- NULL
df$Curricular.units.2nd.sem..without.evaluations. <- NULL
df$Curricular.units.2nd.sem..grade. <- NULL
df$Curricular.units.2nd.sem..approved. <- NULL
df$Curricular.units.2nd.sem..evaluations. <- NULL
df$Curricular.units.2nd.sem..enrolled. <- NULL
df$Curricular.units.2nd.sem..credited. <- NULL
df$Curricular.units.1st.sem..without.evaluations. <- NULL
df$Curricular.units.1st.sem..evaluations. <- NULL
df$Curricular.units.1st.sem..enrolled. <- NULL
df$Curricular.units.1st.sem..credited. <- NULL
df$Tuition.fees.up.to.date <- NULL
df$Father.s.occupation <- NULL
df$Mother.s.occupation <- NULL
df$Father.s.qualification <- NULL
df$Mother.s.qualification <- NULL
df$Nacionality <- NULL
df$Previous.qualification <- NULL
df$Daytime.evening.attendance. <- NULL
df$Application.mode <- NULL
df$Marital.status <- NULL

#Renomeando as colunas
colnames(df) <- c("Ordem de prioridade do curso", "Curso", "Nota da qualificacao anterior",
                  "Nota de admissao", "Deslocado", "Necessidades educacionais especiais", 
                  "Devedor", "Genero", "Bolsista", "Idade na inscricao", "Internacional",
                  "Materias do primeiro semestre aprovadas", "Media das notas do primeiro semestre",
                  "Resultado")

colnames(df) #Checando se as colunas estão renomeadas corretamente


ordem_desejada <- c("Curso", "Ordem de prioridade do curso", "Nota da qualificacao anterior",
                    "Nota de admissao", "Deslocado", "Necessidades educacionais especiais", 
                    "Devedor", "Genero", "Bolsista", "Idade na inscricao", "Internacional",
                    "Materias do primeiro semestre aprovadas", "Media das notas do primeiro semestre",
                    "Resultado")

df <- df[, ordem_desejada]

#Trocando certos números para suas respectivas informações
df$Curso[df$Curso == 33] <- "Biofuel Production Technologies"
df$Curso[df$Curso == 171] <- "Animation and Multimedia Design"
df$Curso[df$Curso == 8014] <- "Social Service (Noturno)"
df$Curso[df$Curso == 9003] <- "Agronomy"
df$Curso[df$Curso == 9070] <- "Communication Design"
df$Curso[df$Curso == 9085] <- "Veterinary Nursing"
df$Curso[df$Curso == 9119] <- "Informatics Engineering"
df$Curso[df$Curso == 9130] <- "Equinculture"
df$Curso[df$Curso == 9147] <- "Management"
df$Curso[df$Curso == 9238] <- "Social Service"
df$Curso[df$Curso == 9254] <- "Tourism"
df$Curso[df$Curso == 9500] <- "Nursing"
df$Curso[df$Curso == 9556] <- "Oral Hygiene"
df$Curso[df$Curso == 9670] <- "Advertising and Marketing Management"
df$Curso[df$Curso == 9773] <- "Journalism and Communication"
df$Curso[df$Curso == 9853] <- "Basic Education"
df$Curso[df$Curso == 9991] <- "Management (Noturno)"

df$Deslocado[df$Deslocado == 1] <- "Sim"
df$Deslocado[df$Deslocado == 0] <- "Nao"

df$'Necessidades educacionais especiais'[df$'Necessidades educacionais especiais' == 1] <- "Sim"
df$'Necessidades educacionais especiais'[df$'Necessidades educacionais especiais' == 0] <- "Nao"

df$Devedor[df$Devedor == 1] <- "Sim"
df$Devedor[df$Devedor == 0] <- "Nao"

df$Bolsista[df$Bolsista == 1] <- "Sim"
df$Bolsista[df$Bolsista == 0] <- "Nao"

df$Internacional[df$Internacional == 1] <- "Sim"
df$Internacional[df$Internacional == 0] <- "Nao"

df$Genero[df$Genero == 1] <- "Homem"
df$Genero[df$Genero == 0] <- "Mulher"

df$Resultado[df$Resultado == "Dropout"] <- "Desistente"
df$Resultado[df$Resultado == "Graduate"] <- "Graduado"
df$Resultado[df$Resultado == "Enrolled"] <- "Matriculado"

write.csv(df, "data_ADAPTED.csv", row.names = FALSE) #escrevendo o arquivo novo

