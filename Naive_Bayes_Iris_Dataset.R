# Naive Bayes Classification

# Defining Data Set
dataset <- iris

# Encoding the Dependent Variable
dataset$Species = factor(dataset$Species, levels = c('setosa','versicolor','virginica'))
dataset$Species

# Splitting the Data Set into Training and Test Sets
library(caTools)
set.seed(1)
split = sample.split(dataset$Species, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scalling
training_set[-5]=scale(training_set[-5])
test_set[-5]=scale(test_set[-5])
                    
# Fitting the Naive Bayes model
library(e1071)
classifier = naiveBayes(x = training_set[-5],
                        y = training_set$Species)

# Predicting the Test Results
y_predict = predict(classifier, newdata = test_set[-5])

# Confusion Matrix
# 1.Option: cm = table(test_set[,5], y_predict)
#install.packages('caret')
#library(ggplot2)
library(caret)
cm = confusionMatrix(data = y_predict, reference = test_set[,5]) 
cm

# Predicting a particular Value
newdata <- t(data.frame(c(-0.3,-0.55,0.2,0.21)))
colnames(newdata) = c('Sepal.Length', 'Sepal.Width', 'Petal.Length','Petal.Width')
y_pred = predict(classifier, newdata = newdata)
y_pred
