setwd("C:\\Users\\davic\\OneDrive\\Documentos\\R\\data")
#Colocando o caminho para o arquivo

df <- read.csv("data_ADAPTED.csv", sep = ",", dec = ".", header = TRUE)

nrow(df)
ncol(df)

colnames(df)

class(df)
class(df$Curso)
class(df$Ordem.de.prioridade.do.curso)
class(df$Nota.da.qualificacao.anterior)
class(df$Nota.de.admissao)
class(df$Deslocado)
class(df$Necessidades.educacionais.especiais)
class(df$Devedor)
class(df$Genero)
class(df$Bolsista)
class(df$Idade.na.inscricao)
class(df$Internacional)
class(df$Materias.do.primeiro.semestre.aprovadas)
class(df$Media.das.notas.do.primeiro.semestre)
class(df$Resultado)

colSums(is.na(df))

min(df$Nota.de.admissao)
max(df$Nota.de.admissao)

mean(df$Nota.de.admissao)
median(df$Nota.de.admissao)

sd(df$Nota.de.admissao)

quantile(df$Nota.de.admissao)

summary(df$Nota.de.admissao)

hist(df$Nota.de.admissao, main = "Histograma da nota de adimissão", xlab = "Nota de adimissão", ylab = "Frequência", col = "mediumblue", xlim = c(80, 200), ylim = c(0, 1000))
abline(v = mean(df$Nota.de.admissao), col = "pink", lwd = 2, lty = 2) # Linha que marca a média
abline(v = median(df$Nota.de.admissao), col = "purple", lwd = 2, lty = 2) # Linha que marca a mediana
legend("topright", legend = c("Média", "Mediana"), col = c("pink", "purple"), lwd = 2, lty = c(2, 2))

boxplot(df$Nota.de.admissao, main = "Boxplot da nota de admissão", xlab = "Nota de admissão", ylim = c(90, 200), col = "mediumblue", horizontal = TRUE)

tabela <- table(df$Genero, df$Resultado) # relação estre Gênero e Resultado
tabela
prop_por_genero <- prop.table(tabela, margin = 1)  # margem 1 = por linha (gênero)
round(prop_por_genero, 3) # arredonda o valor para 3 casas

barplot(tabela, col = c("mediumblue", "pink"), main = "Relação entre resultado por quantidade de homens e mulheres", xlab = "Gênero", ylab = "Quantidade", ylim = c(0, 2500))
legend("topright", legend = c("Homem", "Mulher"), fil = c("mediumblue", "pink"))
barplot(prop_por_genero, beside = TRUE, col = c("mediumblue", "pink"), main = "Proporção dos Resultados por Gênero", xlab = "Gênero", ylab = "Proporção", ylim = c(0, 0.7))
legend("topright", legend = c("Homem", "Mulher"), fil = c("mediumblue", "pink"))

quantile(df$Media.das.notas.do.primeiro.semestre)
faixa_quartis <- cut(df$Media.das.notas.do.primeiro.semestre, breaks = quantile(df$Media.das.notas.do.primeiro.semestre, probs = seq(0, 1, 0.25)), include.lowest = TRUE, labels = c("[0, 11)", "[11, 12.28)", "[12.28, 13.4)", "[13.4, 18.87]"))
tabela <- table(df$Bolsista, faixa_quartis)
tabela
boxplot(Media.das.notas.do.primeiro.semestre ~ Bolsista, data = df, col = c("red", "green"), main = "Desempenho de Bolsistas e Não Bolsistas", ylab = "Bolsista", xlab = "Média das notas do primeiro semestre", horizontal = TRUE)

df_numericas <- df[sapply(df, is.numeric)]
matriz_correlacao <- cor(df_numericas)
matriz_correlacao

plot(df$Nota.de.admissao, df$Media.das.notas.do.primeiro.semestre, col = "mediumblue", pch = 19, xlab = "Notas de admissão", ylab = "Média das notas do primeiro período", main = "Desempenho no primeiro período em relação a nota de adimissão")
ml <- lm(df$Media.das.notas.do.primeiro.semestre ~ df$Nota.de.admissao)
abline(ml, col = "red", lwd = 2)

df_q1 <- df[df$Resultado == "Desistente",c("Deslocado", "Necessidades.educacionais.especiais", "Devedor", "Bolsista", "Materias.do.primeiro.semestre.aprovadas")]
sum(df$Resultado == "Desistente") # Confirmando a quantidade de daodos
nrow(df_q1)
deslocado <- table(df_q1$Deslocado)
necessidades <- table(df_q1$Necessidades.educacionais.especiais)
devedor <- table(df_q1$Devedor)
bolsista <- table(df_q1$Bolsista)
dados <- rbind(bolsista, devedor, deslocado, necessidades)
dados
barplot(dados, col = c("mediumblue", "red", "yellow", "green"), main = "Relação dos dados e resultado na graduação", xlab = "Dados", ylim = c(0, 1600), beside = TRUE)
legend("topright", legend = c("Bolsistas", "Devedores", "Deslocado", "Necessidades educacionais especiais"), fil = c("mediumblue", "red", "yellow", "green"))
calc_prop <- function(var_nome) {
  desistentes_sim <- sum(df_q1[[var_nome]] == "Sim")
  total_sim <- sum(df[[var_nome]] == "Sim")
  return(round(desistentes_sim / total_sim, 3))
}

# Aplicando a função
prop_bolsista <- calc_prop("Bolsista")
prop_devedor <- calc_prop("Devedor")
prop_deslocado <- calc_prop("Deslocado")
prop_nees <- calc_prop("Necessidades.educacionais.especiais")

# Juntando em uma tabela
proporcoes <- c(Bolsista = prop_bolsista, Devedor = prop_devedor, Deslocado = prop_deslocado, Necessidades = prop_nees)

barplot(proporcoes, col = "steelblue", ylim = c(0, 1), main = "Proporção de Desistentes em cada Grupo", ylab = "Proporção", las = 1)

boxplot(df$Idade.na.inscricao ~ df$Resultado, horizontal = TRUE, col = c("red", "mediumblue", "green"), xlab = "Idade na inscrição", ylab = "Resuldado", main = "Relação entre idade na incrição e Resultado")

boxplot(df$Media.das.notas.do.primeiro.semestre ~ df$Bolsista, horizontal = TRUE, xlab = "Média das matérias do primeiro período", ylab = "Bolsista", col = c("mediumblue", "red"))