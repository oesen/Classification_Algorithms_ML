# Support Vector Machine with Linear Kernel

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

# Fitting the SVM model
library(e1071)
classifier = svm(formula = Species ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')

# Predicting the Test Results
y_predict = predict(classifier, newdata = test_set[-5])

# Confusion Matrix
cm = table(test_set[, 5], y_predict)
cm

# Predicting a particular Value
newdata <- t(data.frame(a=c(4,3,4,5)))
y_pred = predict(classifier, newdata)
y_pred
