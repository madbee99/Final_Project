# Final_Project
Individual project - no teammates

Topic: U.S. College Admissions
Why: Interesting to see the data behind someone getting accepted to/rejected by a college  
Data Sources (saved in the [Resources folder](https://github.com/madbee99/Final_Project/tree/main/Resources)):
* Visualizations:  IPEDS (Integrated Postsecondary Education Data System) [data](https://nces.ed.gov/ipeds/datacenter/Data.aspx) submitted to NCES (National Center for Education Statistics)  
      Query: 2009-2019 4-year public/private not-for-profit U.S. degree-granting colleges  
* Model: [Kaggle Graduate Admissions Dataset](https://www.kaggle.com/fsadjadpour/binary)  

The goal of my project is to explore U.S. College Admissions data and then create a machine learning model to predict whether or not someone will get into an unspecified graduate school based on an individual's inputted GRE test score, undergraduate GPA, and undergraduate school rank (1 being the highest and 4 being the lowest).

## Presentation
* Topic: U.S. College Admissions
* Why:
* Data Source Description: [NCES data](https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx?goToReportId=7)  
I selected the variables shown in my *college_data* table within the NCES IPEDS data center for years 2009 to 2019. A screenshot of the general selection criteria for which colleges to include in the dataset is provided below.  
![image](https://user-images.githubusercontent.com/86338416/142742361-92c6f3cd-c73d-4e03-8afd-30f1408e7e0b.png)  


* Questions (hope to answer):
* Data Exploration Description
* Data Analysis Description
* Technologies, Languages, Tools, and Algorithms used:
* Result of Analysis
* Recommendation for Future Analysis
* Anything the team would have done differently

## GitHub
### Brief Outline of Project:
* Choose visualization dataset online: [NCES data](https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx?goToReportId=7)
* Clean data
* Export to Tableau to visualize data
* Create machine learning model using [Kaggle Graduate Admissions Dataset](https://www.kaggle.com/fsadjadpour/binary)  
* Create dashboard using Flask
* Create presentation to show findings

#### Links:
* Link to Demo Video
* [Link to Google Slides presentation](https://docs.google.com/presentation/d/1DgaaoOcsuGPSbVyvlUyBXsonjAKlJpEHfUpoadlsH2c/edit?usp=sharing)
* [Link to Tableau Dashboard](https://public.tableau.com/app/profile/madeleine4973) (choose "FinalProject") 

## Machine Learning Model
For the machine learning model portion of the project, I used a [Graduate Admissions dataset from Kaggle](https://www.kaggle.com/fsadjadpour/binary) with four variables: *admit* (0 = rejected, 1 = admitted), *gre* (GRE score), *gpa* (applicant’s undergraduate gpa), and *rank* (undergraduate school rank with 1 being the highest and 4 being the lowest). I first loaded this dataset into pgAdmin and then used a SQLAlchemy connection string to connect the dataset to the model.  
Since the model needed to predict whether an applicant would be admitted or not to an unspecified graduate school, the *admit* column of the data set was set as the dependent variable (y) and the three other columns/variables (*gre*, *gpa*, and *rank*) were set as the independent variables (x). Since there were only three dependent variables to begin with and they all seemed important to determine an applicants’ admission, there was no selective feature selection involved (i.e., all features were used, with the *admit* variable as the target feature).  
The dataset was then split into testing and training datasets using *sklearn train_test_split* using a train size of 80% and test size of 20% of the original data. The first model iteration did not scale the data, but then I realized that the data should be scaled, as updated in the second model iteration (see *machine_learning_model.ipynb* file). In order for one variable to not carry more weight than it should in the model (i.e., *gre* values can range from 0 to 800 but *gpa* is on a scale of 0 to 4.0 and *rank* is on a scale from 1 to 4, but *gre* is not meant to be captured as 200 times more significant than *gpa* and *rank*), the data were scaled by transforming the data using the StandardScaler class from *sklearn.preprocessing*. The dataset was already clean so there was not much involved in the preprocessing of the data other than checking that there were no null values and then scaling the data.  
Since the model is using binary classification to determine whether or not an applicant will be admitted to graduate school, logistic regression was the appropriate statistical model. One drawback to logistic regression is that it assumes linearity. The original dataset of 400 rows had 273 rejections (*admit* = 0) and 127 admissions (*admit* = 1). I chose to add a balanced class weight to the logistic regression model so there would be an equal number of admissions and rejections available to train the model.
After fitting the training data to the logistic regression model, I tested the significance of the model and found that the training data classification score resulted in 63.75% accuracy and the testing data classification score resulted in 52.5% accuracy.   
The actual balanced accuracy score (comparing the testing admission predictions from the model to the actual testing admissions data) resulted in 58.28% accuracy, meaning that the model correctly predicts whether or not an applicant is admitted to graduate school 58.28% of the time. The confusion matrix resulted in 19 true positives (prediction = admitted, actual = admitted), 32 false positives (prediction = admitted, actual = rejected), 6 false negatives (prediction = rejected, actual = admitted), and 23 true negatives (prediction = rejected, actual = rejected). The confusion matrix screenshot is provided below.  
![image](https://user-images.githubusercontent.com/86338416/142789367-da6121e1-d6fb-4a1d-8c54-ddbc8d51aa22.png)  
As one can see from the accuracy score and the confusion matrix, the model could use some improvement, especially when there are more false positives than true positives, meaning that the model is incorrectly predicting that a student is admitted to graduate school more than the model is correctly predicting that a student is admitted.  
A screenshot of the model code is provided below (link to Github folder [here](https://github.com/madbee99/Final_Project/blob/4188b5fcb28680588efeaad0b946b8e91d35fcc8/final_flask/Screenshots/Machine_learning_model_code.PNG)).    
![image](https://user-images.githubusercontent.com/86338416/142789413-5fae0acf-cec2-4abf-bac9-1bc979859320.png)  

I then connected the code for my model (*run_ml.py*) to a Flask dashboard using an html file for the results (*results.html*). The user is prompted to enter one’s GRE score, GPA, and Undergraduate School rank. Then the *app.py* file runs the prediction method from the *run_ml.py* file and outputs the result using the *results.html*, congratulating the user if the model predicted that the user would be accepted to graduate school, and showing an “uh oh” and a sad emoji image if the model predicted that the user would be rejected.
See the "Dashboard" section for more detail.  


## Database  
I created a SQL database on pgAdmin to store all the data for this project. I used an "inner join" SQL query on *college_data_numerical_state* and *State_key* to create the *combined_table* with both the StateCode (as an integer) and the StateLabel (the corresponding state name), and then dropped the original StateCode column to result in a final *clean_table* with the StateLabel. These tables were used for my Tableau visualizations. I also loaded in my machine learning model dataset from [Kaggle](https://www.kaggle.com/malapatiravi/graduate-school-admission-data/home) into the *clean_model_table* on pgAdmin and then connected this table to my model using a SQLAlchemy connection string.  
See below for a screenshot of my "Final_Project" SQL Database, a list of my six tables, and example queries.  

![image](https://user-images.githubusercontent.com/86338416/142742224-56186836-efee-474f-bb85-273c32280e32.png)  

 See "Database" folder for code, ERD, and other materials.


## Dashboard






