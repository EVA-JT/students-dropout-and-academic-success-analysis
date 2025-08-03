setwd("S:\\UFAL\\4° Semestre\\Probabilidade e Estátistica\\atividades\\ab1.1\\data")
#Colocando o caminho para o arquivo

data2 <- read.csv("filename.csv", head = TRUE, sep=";", dec = ".") #Lendo o arquivo

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
colnames(df) <- c("Ordem de prioridade do curso", "Curso", "Nota da qualificação anterior",
                  "Nota de admissão", "Deslocado", "Necessidades educacionais especiais", 
                  "Devedor", "Gênero", "Bolsista", "Idade na inscrição", "Internacional",
                  "Matérias do 1° semestre aprovadas", "Média das notas do 1° semestre",
                  "Resultado")

colnames(df) #Checando se as colunas estão renomeadas corretamente

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

df$Gênero[df$Gênero == 1] <- "Homem"
df$Gênero[df$Gênero == 0] <- "Mulher"

df$Resultado[df$Resultado == "Dropout"] <- "Desistente"
df$Resultado[df$Resultado == "Graduate"] <- "Graduado"
df$Resultado[df$Resultado == "Enrolled"] <- "Matriculado"

write.csv(df, "teste.csv", row.names = FALSE) #escrevendo o arquivo novo
