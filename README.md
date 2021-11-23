# UC Berkeley Extension Data Analytics Bootcamp: Final Project
By Madeleine Baier


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


## Overview of Presentation (Link [here](https://docs.google.com/presentation/d/1DgaaoOcsuGPSbVyvlUyBXsonjAKlJpEHfUpoadlsH2c/edit?usp=sharing))  
* Topic: U.S. College Admissions
* Why: Interesting to see the data behind someone getting accepted to/rejected by a college  
* Data Sources (saved in the [Resources folder](https://github.com/madbee99/Final_Project/tree/main/Resources)):  
  * Visualizations:  IPEDS (Integrated Postsecondary Education Data System) [data](https://nces.ed.gov/ipeds/datacenter/Data.aspx) submitted to NCES (National Center for Education Statistics)    
    * Query: 2009-2019 4-year public/private not-for-profit U.S. degree-granting colleges      
      I selected the variables shown in my *college_data* table within the NCES IPEDS data center for years 2009 to 2019. A screenshot of the general selection criteria for which colleges to include in the dataset is provided below.    
      ![image](https://user-images.githubusercontent.com/86338416/142742361-92c6f3cd-c73d-4e03-8afd-30f1408e7e0b.png)  

  * Logistic Regression Model: [Kaggle Graduate Admissions Dataset](https://www.kaggle.com/fsadjadpour/binary)    

The goal of my project is to explore U.S. College Admissions data and then create a machine learning logistic regression model to predict whether or not someone will get into an unspecified graduate school based on an individual's inputted GRE test score, undergraduate GPA, and undergraduate school rank.  

* Questions:
  * What SAT and ACT score ranges should an applicant have for a reasonable chance to be admitted to a particular college?  
  * Does gender play a role in likelihood of acceptance?  
  * Are there any surprising year-over-year changes in applicants (# of applicants, SAT and ACT score range changes, etc.)?  
  * In particular, what does a select group of college admission stats look like?  

* Data Exploration/Analysis: See Tableau dashboard [here](https://public.tableau.com/app/profile/madeleine4973) (choose "FinalProject"). Select screenshots provided below (also available in the ["Visualization_Screenshots"](https://github.com/madbee99/Final_Project/tree/main/Visualization_Screenshots) folder).  
![AAE_2015_Stanford_Cal_UCLA_Princeton](https://user-images.githubusercontent.com/86338416/142790209-66284183-2c3c-44e9-a15f-842ff2c45b03.PNG)  
![ACT_Composite_Scores_Stanford_Cal_UCLA_Princeton](https://user-images.githubusercontent.com/86338416/142790245-b276f65e-798a-45b9-b3ed-65d71637b3db.PNG)  
![SAT_Math_Scores_Stanford_Cal_UCLA_Princeton](https://user-images.githubusercontent.com/86338416/142790262-d7d5d6b5-ca68-4dfd-bd4c-4736de2e608d.PNG)  

* Technologies, Languages, Tools, and Algorithms used:
  * Jupyter Notebook - Python
     * sklearn Logistic Regression
  * PgAdmin - PostgreSQL
  * Tableau
  * Flask
  * HTML/Javascript

* Result of Analysis: Highlights:
  * Each year from 2011 to 2019, UCLA received more applications from women than men  
  * Each year from 2011 to 2019, Stanford University and Princeton University received significantly fewer applications than UC Berkeley and UCLA  
    * More students are admitted and end up enrolling each year at UC Berkeley and UCLA than at Stanford University and Princeton University  
  * Stanford University and Princeton University ACT Composite and SAT Math score 25th and 75th percentiles have remained stagnant or increased over the years (2009 to 2019)  
  * UC Berkeley and UCLA have seen relatively faster improvement in ACT Composite and SAT Math score 25th and 75th percentiles
* Analysis Questions: Answered:
  * What SAT and ACT score ranges should an applicant have for a reasonable chance to be admitted to a particular college?  
*It depends on the school and the year. I would recommend looking at the 25th and 75th percentile test scores for a particular college and then aim to do at least as well as the 25th percentile score, but in general, the higher one's score, the higher the likelihood of acceptance.*  
  * Does gender play a role in likelihood of acceptance?  
*Not necessarily. There is insufficient data to answer this question. Although it does seem that certain schools like UCLA tend to admit more women than men because more women apply, schools like Stanford University and Princeton University tend to admit fairly even numbers of women and men even in years when more men have applied (see 2015 AAE slide within presentation).*
  * Are there any surprising year-over-year changes in applicants (# of applicants, SAT and ACT score range changes, etc.)? 
*The range widths tend to stay the same but the 25th and 75th percentiles generally seem to have increased over the years (meaning one needs to have better SAT/ACT scores for their application to be competitive).*  
  * In particular, what does a select group of college admission stats look like?  
*See the analyses on Stanford University, UC Berkeley, UCLA, and Princeton University within the presentation.*  

* Recommendation for Future Analysis/Things I would have done differently:
  * Find a more complex dataset for the machine learning model  
  * This analysis was limited to publicly-accessible data; a future analysis could study privately-available applicant data for a specific university -- data for each individual applicant, his/her test scores, GPA, letters of recommendation, acceptance/rejection, etc.  
  * Spend more time learning HTML and dashboard formatting  


## Machine Learning Model
For the machine learning model portion of the project, I used a [Graduate Admissions dataset from Kaggle](https://www.kaggle.com/fsadjadpour/binary) with four variables: *admit* (0 = rejected, 1 = admitted), *gre* (GRE score), *gpa* (applicant’s undergraduate GPA), and *rank* (undergraduate school rank with 1 being the highest and 4 being the lowest). I first loaded this dataset into pgAdmin and then used a SQLAlchemy connection to connect the database to the model.
<p>
Since the model needed to predict whether an applicant would be admitted or not to an unspecified graduate school, the *admit* column of the dataset was set as the dependent variable (y) and the three other columns/variables (*gre*, *gpa*, and *rank*) were set as the independent variables (x). Since there were only three dependent variables to begin with and they all seemed important to determine an applicants’ admission, there was no selective feature selection involved (i.e., all features were selected, with the *admit* variable as the target feature).
 <p>
The dataset was then split into testing and training datasets using *sklearn train_test_split* with a training size of 80% and a test size of 20% of the original data. The first iteration of the model did not scale the data, but after realizing that the data should be scaled, I updated my model (see second iteration of the model in *machine_learning_model.ipynb* file). In order for one variable to not carry more weight than it should in the model (i.e., *gre* values can range from 0 to 800 but *gpa* is on a scale of 0 to 4.0 and *rank* is on a scale from 1 to 4, but *gre* is not meant to be captured as 200 times more significant than *gpa* and *rank*), the data were scaled by transforming the data using the StandardScaler class from *sklearn.preprocessing*. The dataset was already clean so there was not much involved in the preprocessing of the data other than checking that there were no null values and then scaling the data.
<p>
Since the model is using binary classification to determine whether or not an applicant will be admitted to graduate school, logistic regression was the appropriate statistical model. One drawback to logistic regression is that it assumes linearity. The original dataset of 400 rows had 273 rejections (*admit* = 0) and 127 admissions (*admit* = 1). I chose to add a balanced class weight to the logistic regression model so there would be an equal number of admissions and rejections available to train the model.
 <p>
After fitting the training data to the logistic regression model, I tested the significance of the model and found that the training data classification score resulted in 63.75% accuracy and the testing data classification score resulted in 52.5% accuracy.
  <p>
The actual balanced accuracy score (comparing the testing admission predictions from the model to the actual testing admissions data) resulted in 58.28% accuracy, meaning that the model correctly predicts whether or not an applicant is admitted to graduate school 58.28% of the time. The confusion matrix resulted in 19 true positives (prediction = admitted, actual = admitted), 32 false positives (prediction = admitted, actual = rejected), 6 false negatives (prediction = rejected, actual = admitted), and 23 true negatives (prediction = rejected, actual = rejected). The confusion matrix screenshot is provided below.  

   ![Confusion_matrix](https://user-images.githubusercontent.com/86338416/142792503-32a65eac-aed4-498e-9945-0ceb9bfb9b66.PNG)

As one can see from the accuracy score and the confusion matrix, the model could use some improvement, especially when there are more false positives than true positives, meaning that the model is incorrectly predicting that a student is admitted to graduate school more than the model is correctly predicting that a student is admitted.  
A screenshot of the model code is provided below (link to Github folder [here](https://github.com/madbee99/Final_Project/blob/5358efb882abc67e0d6fc7eca5a13704fe9d8f5f/final_flask/Screenshots/Machine_learning_model_code.PNG)).      

![image](https://user-images.githubusercontent.com/86338416/142789413-5fae0acf-cec2-4abf-bac9-1bc979859320.png)  

I then connected the code for my model (*run_ml.py*) to a Flask dashboard using an html file for the results (*results.html*). The user is prompted to enter one’s GRE score, GPA, and Undergraduate School rank. Then the *app.py* file runs the prediction method from the *run_ml.py* file and outputs the result using the *results.html*, congratulating the user if the model predicted that the user would be accepted to graduate school, and showing an “uh oh” and a sad emoji image if the model predicted that the user would be rejected.
See the "Dashboard" section for more detail.  


## Database  
I created a SQL database on pgAdmin to store all the data for this project. I used an "inner join" SQL query on *college_data_numerical_state* and *State_key* to create the *combined_table* with both the StateCode (as an integer) and the StateLabel (the corresponding state name), and then dropped the original StateCode column to result in a final *clean_table* with the StateLabel. These tables were used for my Tableau visualizations. I also loaded in my machine learning model dataset from [Kaggle](https://www.kaggle.com/fsadjadpour/binary) into the *clean_model_table* on pgAdmin and then connected this table to my model using a SQLAlchemy connection string.  
See below for a screenshot of my "Final_Project" SQL Database, a list of my six tables, and example queries.  

![image](https://user-images.githubusercontent.com/86338416/142742224-56186836-efee-474f-bb85-273c32280e32.png)  

 See ["Database"](https://github.com/madbee99/Final_Project/tree/main/Database) folder for code, ERD, and other materials. Click [here](https://github.com/madbee99/Final_Project/blob/e3142ad0120fe9aebf28f3f8e992657bbd7b9b8b/final_flask/sqlqueries.sql) for a link to all SQL queries used.


## Dashboard
Screenshots of Dashboard below and also saved in this [Github folder](https://github.com/madbee99/Final_Project/tree/main/final_flask/Screenshots). See demo video for more detail.
![dashboard_pg1](https://user-images.githubusercontent.com/86338416/142791305-60ea08f7-e007-43ba-8d59-a81e0e59285e.PNG)
![dashboard_pg2](https://user-images.githubusercontent.com/86338416/142791336-b22d1469-5bff-43fb-8d3b-bf0f8c309df8.PNG)
![dashboard_pg3](https://user-images.githubusercontent.com/86338416/142791341-eceaacc1-a8db-4b23-a1ae-290a32554c9e.PNG)
![dashboard_pg4](https://user-images.githubusercontent.com/86338416/142791350-3aae58e5-09f4-4673-a243-4d9779c82a63.PNG)

If user input in the Graduate Admissions Predictor results in a model prediction of admission, this is the result: 
![admission_prediction_result_html](https://user-images.githubusercontent.com/86338416/142791438-4b86bf4b-7134-4a36-b936-80cc97ab32e1.PNG)  


If the model prediction is rejection, this is the result:  
![rejection_prediction_result_html](https://user-images.githubusercontent.com/86338416/142791385-f3f09170-d960-43bb-87c4-d34bf01883ba.PNG)  


