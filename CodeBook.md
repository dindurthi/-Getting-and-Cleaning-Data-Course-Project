# Code Book

<p> The documents in the repository are
 <ul>
   <li>Readme.md -Introduction to the repository </li>
   <li>run_analysis.R - contains R code</li>
   <li>CodeBook.md - Explains the variables and working of the code</li>
   <li> tidy_data.txt -contains tidy data set</li>
   </ul>
   </p>
  <h2> Source Data set </h2>
  <p> The source data set consists of two data sets- train and test. All the files in the source data set are
  <ul>
    <li> X-train -Training set ,7532 observations of 79 variables </li>
    <li> Y-train - Training labels ,7532 observations of 1 variable </li>
    <li>Subject_train -subject performing an activity within the range of 1 to 30, 7532 observations of 1 variable </li>
    <li> X-test -Testing set, 2947 observations of 79 variables</li>
    <li> Y-test-Test Labels ,2947 observations of 1 variable</li>
    <li>Subject_test-subject performing an activity within the range of 1 to 30, 2947 observations of 1 variable </li>
    <li>features -list of all the features</li>
    <li> activity_labels- list of class labels with activity </li>
    </ul> </p>
     <h2> Transformations made to create Tidy data </h2>
     <p> The following transformations were made to obtain tidy data 
  <ol>
    <li> The dataset was downloaded from the link using the function download.file() and  unzipped using unzip() function </li>
    <li> The data is read from both the data subsets train and test using read.table() function. The data is stored in the corresponding variables X_train,Y_train, Subject_train,X_test,Y_test,Subject_test </li>
    <li> Features and activity labels are read and stored in the variables activity and features </li>
    <li> Only mean and standard deviation are extracted using the grep() and the same are selected from the data set variable X</li>
    <li> The data is merged into a single data set called all_data ()</li>
    <li> Descriptive names are given for each activity </li>
    <li> data is factored and reshaped </li>
    <li> Tidy data is written to a file "tidy_data.txt" </li>
    </ol></p>
