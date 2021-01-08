library(ggplot2)
library(corrplot)
library(ggcorrplot)



# Wordlist ----------------------------------------------------------------

General.list %>% 
  mutate(tokens = forcats::fct_reorder(word, freq, .desc=TRUE)) %>%
  slice(1:30) %>%
  ggplot(., aes(x=tokens, y=freq))+
  geom_point(size=3) + 
  geom_segment(aes(x=tokens, 
                   xend=tokens, 
                   y=0, 
                   yend=freq)) + 
  labs(caption="Source: Data",
       x = "Tokens",
       y = "Relative Frequency") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

# Correlation -------------------------------------------------------------

ggcorrplot(correlation,  type = "upper", lab = TRUE, digits=3,outline.col = "darkgrey",hc.order = TRUE,insig = "blank",show.diag=FALSE,sig.level=0.05,legend.title = "Corr.", ggtheme=ggplot2::theme_minimal(),colors = c("#3e7a2a", "white", "#852e81"))

rm(strategies_occurence)



# Strategies frequency ----------------------------------------------------

colnames(strategies_occurences)<-c('Estrategias','abv','ocorr','freq')
strategies_occurences$freq<-round(strategies_occurences$freq,2)
strategies_occurences %>% 
  dplyr::mutate(abv = forcats::fct_reorder(abv, freq, .desc=TRUE)) %>%
  ggplot(., aes(x=abv, y=freq,fill=as.factor(abv))) +
  geom_bar(stat="identity")+
  geom_text(aes(label=freq), vjust=-0.3, size=3.5)+
  labs(caption="Fonte: Dados",
       x = "Estratégias",
       y = "Frequência Relativa")+
  theme_minimal()+
  theme(legend.position="none")
