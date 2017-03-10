dataIris = read.csv(file = 'iris.txt', sep = "\t")

#funckja badajaca zmienna
badanie_zmiennej = function(zmiennaCalosc, zmiennaGrupaSetosa, zmiennaGrupaVersicolor, zmiennaGrupaVirginica, nazwaZmiennej){
  opisowe_statystyki(zmiennaCalosc, paste(nazwaZmiennej, "(suma)"))
  
  opisowe_statystyki(zmiennaGrupaSetosa, paste(nazwaZmiennej, "(grupa Setosa)"))
  opisowe_statystyki(zmiennaGrupaVersicolor, paste(nazwaZmiennej,"(grupa Versicolor)"))
  opisowe_statystyki(zmiennaGrupaVirginica, paste(nazwaZmiennej,"(grupa Virginica)"))
  
  quartz()
  boxplot(zmiennaCalosc, zmiennaGrupaSetosa, zmiennaGrupaVersicolor, zmiennaGrupaVirginica, names = c('calosc','Setosa','Versicolor', 'Virginica'), main =nazwaZmiennej )
}

badanie_zmiennej( dataIris$sepallength, 
                  dataIris$sepallength[dataIris$class=='Iris-setosa'], 
                  dataIris$sepallength[dataIris$class=='Iris-versicolor'], 
                  dataIris$sepallength[dataIris$class=='Iris-virginica'], "Sepal Length")

# wnioski:
# Długość Sepal Length
# Wszystkie klasy maja rozklad okolo normalmy, aczkolwiek najmniej podobne do n jest 
# Virginica (więcej danych po prawej stronie, ma w ogóle odstający punkt)
# Rozkłąd średnich: Setosa < Versicolor < Virginica
# Mała wariancja    0.12      0.26            0.4
# Małe odchylenie


badanie_zmiennej( dataIris$sepalwidth, 
                  dataIris$sepalwidth[dataIris$class=='Iris-setosa'], 
                  dataIris$sepalwidth[dataIris$class=='Iris-versicolor'], 
                  dataIris$sepalwidth[dataIris$class=='Iris-virginica'], "Sepal Width")

# Sepal Width
# Wszystkie klasy mają rozkłąd normlany 
# Średnia szerokość jest już inna niz w przypadku length:Versicolor < Virginica < Setosa




              






  
