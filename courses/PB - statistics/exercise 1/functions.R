m = function(name, ...){
  message(paste(name, ...))
}



descriptive_statistics = function(zmienna, name){
  #m('analysis of:  ', name)
  #sprawdzenie statystyk opisoych
  summary(zmienna)
  #m("Min.:", summary(zmienna)['Min.'])
  #m("1st Qu.:", summary(zmienna)['1st Qu.'])
  #message(paste("Median:", summary(zmienna)['Median']))
  #message(paste("Mean:", summary(zmienna)['Mean']))
  #message(paste("3rd Qu.:", summary(zmienna)['3rd Qu.']))
  #message(paste("Max.:", summary(zmienna)['Max.']))
  
  m('variance', var(zmienna))
  m('standard dev', sd(zmienna))
  
  # check modality
  
  # skoścność z pakietu e1071
  m('skewness', skewness(zmienna), '(jeżeli dodatnie to prawy brzeg jest dłuższy, jeżeli ujemne - to lewy)')
  # kurtoza z pakietu e1071
  m('kurtoza',kurtosis(zmienna), '+ : wystaje ponad normalny; - : poniżej normalnego')
  
  # sprawdź czy zmienne mają rozkład normalny (jezeli p-value < 0.05, to NIE JEST normalny)
  m('shapiro: p-value: ',shapiro.test(zmienna)[2], '(if p-value < 0.05 - NOT NORMAL)')
  
  #quartz()
  # histogram
  #par(mfrow=c(1,2))
  #hist(zmienna, plot = TRUE, main = paste('histogram:',name))
  
  #skrzynka z wąsami
  # quartz()
  #boxplot(zmienna, main = paste('boxplot:',name)) 
}

