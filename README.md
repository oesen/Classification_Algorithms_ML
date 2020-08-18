# Classification_Algorithms_ML
This repo contains several exercises of the commonly used classification algorithms in ML, which were implemented in R and Python.

The classification algorithms that are to be performed within the scope of this project are listed below. The first four of them were already carried out and the rest will be conducted step by step.

* Logistic Regression
* K - Nearest Neighbors (K-NN)
* Support Vector Machine (SVM)
* Naive Bayes Classification
* Decision Tree Classification
* Random Forest Classification

Before diving into any other details, I prefer giving an overview about the data set used, which could be really helpful to comprehend the further steps.

### Getting Familiar with the Data Set
It is always useful to get a first impression of how the data set looks like. The following part contains the associated explanation comments, therefore, the code used for having first impression about iris data set.

```
names(iris) # gives the columns contained by the data set
head(iris, 3) # the first 3 rows of the data set
tail(iris, 3) # the last 3 rows of the data set
mean(iris$Sepal.Width) # mean of a particular column
median(iris$Sepal.Width) # median of a particular column
sd(iris$Sepal.Width) # standard deviation of a particular column
summary(iris) # provides a summary of vital information related to the dataset
any(complete.cases(iris) == FALSE) # Checking missing values/cases with missing values
```
Just for offering better understanding, the output of the 'summary' command is given below.
```
Sepal.Length    Sepal.Width     Petal.Length    Petal.Width   
Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100  
1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300  
Median :5.800   Median :3.000   Median :4.350   Median :1.300  
Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199  
3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800  
Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
     Species  
setosa    :50  
versicolor:50  
virginica :50
```
Afterwards, I leveraged from subsetting in order to deepen my understanding of the data. In doing so, it was possible to examine a particular class (in this case virginica class) even by considering some extra conditions such as where petal length is greater than 5.

```
virginicas = subset(iris, Species=='virginica')
dim(virginicas)
dim(iris)
subset(iris, Species=='virginica' & Petal.Length > 5)
dim(subset(iris, Species=='virginica' & Petal.Length > 5))
```

### Visualisation of the Data Set

Having examined the structure of the data, the next step focuses on the visualisation of the features for deeper understanding.

First of all, I defined a function to plot the graphs. The code is given below. This code illustrates a powerful combination of violin graphs and scatter plots. This mapping combination allows the determination of data distributions and the observation of each data point individually.

```
function_graph = function(x,y) {
a =  ggplot(data=iris,aes(x,y,colour=Species)) +
  geom_violin(size=I(1.2)) +
  geom_point(aes(x,y)) +
  facet_grid(iris$Species~.,scales="free", drop=TRUE) +
  theme(axis.title.x=element_text(colour="Black", size=15),
        axis.text.x=element_text(size=10),
        axis.title.y=element_text(colour="Black", size=15),
        axis.text.y=element_text(size=10),
        plot.title= element_text(size=20,
                                 colour ="Navy Blue",
                                 hjust = 0.5))
return(a)
}
```
The first graph presents the relation between sepal length and sepal width features, while the second one demonstrates the relation among petal features.

```
# Visualisation of Sepal Length vs Sepal Width
function_graph(iris$Sepal.Length, iris$Sepal.Width) +
  ggtitle('Sepal Length vs. Sepal Width') +
  xlab('Sepal Length') +
  ylab('Sepal Width') +
  coord_cartesian(ylim=c(0,5))
```
![1.chart](https://raw.githubusercontent.com/oesen/Classification_Algorithms_ML/master/Images/Rplot_1.jpeg)

```
# Visualisation of Petal Length vs Petal Width
function_graph(iris$Petal.Length,iris$Petal.Width) +
  ggtitle('Petal Length vs. Petal Width') +
  xlab('Petal Length') +
  ylab('Petal Width') +
  coord_cartesian(ylim=c(0,3))
```
![2.chart](https://raw.githubusercontent.com/oesen/Classification_Algorithms_ML/master/Images/Rplot_2.jpeg)

### Demonstration of the Separation of Classes
This section in contrast to prior steps was performed in Python. The following part demonstrates how the classes based on the considered features are separated from one another.

```
# Data Preprocessing
x = iris.iloc[:,0].values
y = iris.iloc[:,1].values

# Appending colors
species = np.array(iris.species)
colors = []
for i in iris.species:
  if i == 'setosa':
    colors.append('red')
  elif i == 'versicolor':
    colors.append('blue')
  else:
    colors.append('green')
x_min, x_max = x.min() - .25, x.max() + .25
y_min, y_max = y.min() - .25, y.max() + .25

# Scatterplot for Sepal Length and Sepal Width
plt.figure()
plt.scatter(x,y, c=colors)
plt.xlabel("Sepal Length")
plt.ylabel("Sepal Width")
plt.title ("Classification by Sepal Size")
plt.xlim(x_min,x_max)
plt.ylim(y_min, y_max)
```
![3.chart](https://raw.githubusercontent.com/oesen/Classification_Algorithms_ML/master/Images/Plot3_SepalSizeClassification.png)

```
# Data Preprocessing
x = iris.iloc[:,2].values
y = iris.iloc[:,3].values

# Appending colors
species = np.array(iris.species)
colors = []
for i in iris.species:
  if i == 'setosa':
    colors.append('yellow')
  elif i == 'versicolor':
    colors.append('purple')
  else:
    colors.append('orange')
x_min, x_max = x.min() - .25, x.max() + .25
y_min, y_max = y.min() - .25, y.max() + .25

# Scatterplot for Petal Length and Petal Width
plt.figure()
plt.scatter(x,y, c=colors2)
plt.xlabel("Petal Length")
plt.ylabel("Petal Width")
plt.title ("Classification by Petal Size")
plt.xlim(x_min,x_max)
plt.ylim(y_min, y_max)
```
![4.chart](https://raw.githubusercontent.com/oesen/Classification_Algorithms_ML/master/Images/Plot4_PetalSizeClassification.png)
