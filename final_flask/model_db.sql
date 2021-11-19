/*SQL Queries for the Model Portion of Project*/

/Create table
CREATE TABLE CLEAN_MODEL_DATA(
 admit INT,
 gre FLOAT,
 gpa FLOAT,
 rank INT
);

/*Import csv file with data*/
 
/*Check that data was successfully imported*/
SELECT * FROM clean_model_data;
