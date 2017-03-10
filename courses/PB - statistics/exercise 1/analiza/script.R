# te muszą być zainstalowane: 
# install.packages("gdata", "e1071")
# install.packages("e1071")

# library(gdata)
# library(e1071)
# library(dplyr)
dataZarobki = read.xls('W1_OcenyIlorazIntelZarobki.xlsx')



#funckja badajaca zmienna
badanie_zmiennej = function(zmiennaCalosc, zmiennaGrupaA, zmiennaGrupaB, nazwaZmiennej){
  opisowe_statystyki(zmiennaCalosc, paste(nazwaZmiennej, "(suma)"))

  opisowe_statystyki(zmiennaGrupaA, paste(nazwaZmiennej, "(grupa A)"))
  opisowe_statystyki(zmiennaGrupaB, paste(nazwaZmiennej,"(grupa B)"))
  quartz()
  boxplot(zmiennaCalosc, zmiennaGrupaA, zmiennaGrupaB, names = c('calosc','grupa A ','grupa B'), main =nazwaZmiennej )
}


#badanie inteligencji
badanie_zmiennej( dataZarobki$iloraz_intelig, dataZarobki$iloraz_intelig[dataZarobki$grupa=='A'], dataZarobki$iloraz_intelig[dataZarobki$grupa=='B'], "iloraz inteligencji")

#badanie ocen
# badanie_zmiennej( dataZarobki$oceny, dataZarobki$oceny[dataZarobki$grupa=='A'], dataZarobki$oceny[dataZarobki$grupa=='B'], "oceny")

#badanie zarobków
zmienna = dataZarobki$zarobki
#badanie_zmiennej( zmienna, zmienna[dataZarobki$grupa=='A'], zmienna[dataZarobki$grupa=='B'], "zarobki")

# badanie zarobków bez dwoch max wartosci
zmienna =  zarobki[!is.na(zarobki) & zarobki != 40000 & zarobki != 12000]
#badanie_zmiennej( zmienna, zmienna[dataZarobki$grupa=='A'], zmienna[dataZarobki$grupa=='B'], "zarobki")


# scatterploty
quartz()
dataZarobkiBezMax = dataZarobki[!dataZarobki$zarobki %in% c(40000, 12000), ]
plot(dataZarobkiBezMax$iloraz_intelig, dataZarobkiBezMax$zarobki, main = "inteligencja vs zarobki")
plot(dataZarobkiBezMax$oceny, dataZarobkiBezMax$zarobki, main = "oceny vs zarobki")
plot(dataZarobkiBezMax$iloraz_intelig, dataZarobkiBezMax$oceny, main = "iloraz inteligencji vs oceny")
#wnioski ze scatterplów - brak korelacji pomiędzy zmiennymi niepogrupowanymi


# wnioski? 
# Grupa A jest mądrzejsza, ale zarabia więcej grupa B :)
# Najwięcej zarabia ktoś z IQ = 111 (max IQ to 134)



# graphics.off() wylacza wszystkie okna 






