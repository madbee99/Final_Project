# Final_Project
Individual project - no teammates

Topic: 2019 California College Admisssions

The goal of my project is to predict whether or not someone will get into a particular college (chosen from a drop-down menu) based on an individual's inputted test scores and admissions/acceptance rates, etc. for that particluar school.

My dataset is from https://nces.ed.gov and is saved in the [Resources folder](https://github.com/madbee99/Final_Project/tree/main/Resources). I've selected only 4-year colleges located in California for the dataset. I am debating whether or not I just want to use test scores (SAT and ACT) as predictor variables or also use some of the categorical variables (whether or not a secondary GPA is required in one's applciation).  

Here are screenshots of the selections I made for my dataset:  
![image](https://user-images.githubusercontent.com/86338416/139623166-586295a6-70bf-498e-a79c-e39228ce1a2e.png)  
![image](https://user-images.githubusercontent.com/86338416/139623200-94beb5d1-5766-405e-92d4-d678b2f195ec.png)  
![image](https://user-images.githubusercontent.com/86338416/139623219-eae85508-bb51-4469-94e0-44cbe36a94ba.png)  
![image](https://user-images.githubusercontent.com/86338416/139623309-ae43b63a-03f2-4f40-9e55-fcf7328cdb41.png)

Here is an rough draft outline of my project:
1. Clean the dataset - remove empty rows, unnecessary columns, make sure all data is formatted accordingly.
2. Output dataset to pgAdmin.
3. Connect dataset to Tableau - create graphs that display the various 25th and 75th percentile test scores. Think about differentiating between public/private schools. Show graphs with acceptance rates and how they may vary among males and females.
4. Create a model to predict whether or not someone with particular SAT/ACT scores will be accepted to the college. Question for TAs/instructors: how do I calculate an accuracy score when there is not a specific variable column showing "accepted or not" because each row entry is aggregated data for a particular college, not all the applicants for one college and whether or not each applicant was accepted?

Questions:
* Should I have a drop-down menu for someone to choose one of the colleges, then enter their SAT/ACT scores, and then the model outputs whether or not they are likely to be accepted? Or should I just have someone enter their SAT/ACT scores and then output a list of the colleges that they are likely to get into?
* Should I try to find a better dataset that has an "Accepted?" column?


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
* Structured Outline of Project
* Links:
*     Link to Demo Video
*     [Link to Google Slides presentation](https://docs.google.com/presentation/d/1DgaaoOcsuGPSbVyvlUyBXsonjAKlJpEHfUpoadlsH2c/edit?usp=sharing)

## Machine Learning Model
* Description of data preprocessing
* Description of feature engineering/selection; team's decision-making process
* Description of how the data was split into testing/training sests
* Explanation of model choice, including limitations and benefits
* Explanation of changes in model choice (if changes occurred)
* Description of how the model was trained
* Description and explanation of model's confusion matrix, including final accuracy score

## Database  
I created a SQL database on pgAdmin to store all the data for this project. I used an "inner join" SQL query on *college_data_numerical_state* and *State_key* to create the *combined_table* with both the StateCode (as an integer) and the StateLabel (the corresponding state name), and then dropped the original StateCode column to result in a final *clean_table* with the StateLabel. These tables were used for my Tableau visualizations. I also loaded in my machine learning model dataset from [Kaggle](https://www.kaggle.com/malapatiravi/graduate-school-admission-data/home) into the *clean_model_table* on pgAdmin and then connected this table to my model using a SQLAlchemy connection string.  
See below for a screenshot of my "Final_Project" SQL Database, a list of my six tables, and example queries.  

![image](https://user-images.githubusercontent.com/86338416/142742224-56186836-efee-474f-bb85-273c32280e32.png)  

 See "Database" folder for code, ERD, and other materials.


## Dashboard






