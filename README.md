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
* Choose dataset online: [NCES data](https://nces.ed.gov/ipeds/datacenter/DataFiles.aspx?goToReportId=7)
* Clean data
* Export to Tableau to visualize data
* Create machine learning model
* Create dashboard using Flask
* Create presentation to show findings

#### Links:
* Link to Demo Video
* [Link to Google Slides presentation](https://docs.google.com/presentation/d/1DgaaoOcsuGPSbVyvlUyBXsonjAKlJpEHfUpoadlsH2c/edit?usp=sharing)
* [Link to Tableau Dashboard](https://public.tableau.com/app/profile/madeleine4973) (choose "FinalProject") 

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






