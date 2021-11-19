/*SQL Portion of Final Project*/
/*Creating and joining tables*/

DROP TABLE college_data;
CREATE TABLE college_data_numerical_state(UnitID SERIAL,
 SchoolName VARCHAR,
 StateCode VARCHAR,
 Sector VARCHAR,
 OpenAdmissionPolicy VARCHAR,
 GPA VARCHAR,
 SchoolRank VARCHAR,
 SecondarySchoolRecord VARCHAR,
 Recs VARCHAR,
 ApplicantsTotal FLOAT,
 ApplicantsMen FLOAT,
 ApplicantsWomen FLOAT,
 AdmissionsTotal FLOAT,
 AdmissionsMen FLOAT,
 AdmissionsWomen FLOAT,
 EnrolledTotal FLOAT,
 EnrolledMen FLOAT,
 EnrolledWomen FLOAT,
 SAT_RW_25 FLOAT,
 SAT_RW_75 FLOAT,
 SAT_Math_25 FLOAT,
 SAT_Math_75 FLOAT,
 ACT_Composite_25 FLOAT,
 ACT_Composite_75 FLOAT,
 ACT_English_25 FLOAT,
 ACT_English_75 FLOAT,
 ACT_Math_25 FLOAT,
 ACT_Math_75 FLOAT,
 SchoolYear INT);
 
 SELECT * FROM college_data;
 
 CREATE TABLE college_data_numerical_state(UnitID INT,
 SchoolName VARCHAR,
 StateCode INT,
 Sector VARCHAR,
 OpenAdmissionPolicy VARCHAR,
 GPA VARCHAR,
 SchoolRank VARCHAR,
 SecondarySchoolRecord VARCHAR,
 Recs VARCHAR,
 ApplicantsTotal FLOAT,
 ApplicantsMen FLOAT,
 ApplicantsWomen FLOAT,
 AdmissionsTotal FLOAT,
 AdmissionsMen FLOAT,
 AdmissionsWomen FLOAT,
 EnrolledTotal FLOAT,
 EnrolledMen FLOAT,
 EnrolledWomen FLOAT,
 SAT_RW_25 FLOAT,
 SAT_RW_75 FLOAT,
 SAT_Math_25 FLOAT,
 SAT_Math_75 FLOAT,
 ACT_Composite_25 FLOAT,
 ACT_Composite_75 FLOAT,
 ACT_English_25 FLOAT,
 ACT_English_75 FLOAT,
 ACT_Math_25 FLOAT,
 ACT_Math_75 FLOAT,
 SchoolYear INT);
 
 SELECT * FROM college_data_numerical_state;
 
 DROP TABLE state_key;
 CREATE TABLE state_key(
 StateCode INT,
 StateLabel VARCHAR);
 
 SELECT * FROM state_key;
 
 DROP TABLE combined_TABLE;
 CREATE TABLE combined_TABLE as(
 SELECT  college_data_numerical_state.UnitID,
  college_data_numerical_state.SchoolName,
  college_data_numerical_state.StateCode,
  state_key.StateLabel,
  college_data_numerical_state.Sector,
  college_data_numerical_state.OpenAdmissionPolicy,
  college_data_numerical_state.GPA,
  college_data_numerical_state.SchoolRank,
  college_data_numerical_state.SecondarySchoolRecord,
  college_data_numerical_state.Recs,
  college_data_numerical_state.ApplicantsTotal,
  college_data_numerical_state.ApplicantsMen,
  college_data_numerical_state.ApplicantsWomen,
  college_data_numerical_state.AdmissionsTotal,
  college_data_numerical_state.AdmissionsMen,
  college_data_numerical_state.AdmissionsWomen,
  college_data_numerical_state.EnrolledTotal,
  college_data_numerical_state.EnrolledMen,
  college_data_numerical_state.EnrolledWomen,
  college_data_numerical_state.SAT_RW_25,
  college_data_numerical_state.SAT_RW_75,
  college_data_numerical_state.SAT_Math_25,
  college_data_numerical_state.SAT_Math_75,
  college_data_numerical_state.ACT_Composite_25,
  college_data_numerical_state.ACT_Composite_75,
  college_data_numerical_state.ACT_English_25,
  college_data_numerical_state.ACT_English_75,
  college_data_numerical_state.ACT_Math_25,
  college_data_numerical_state.ACT_Math_75,
  college_data_numerical_state.SchoolYear FROM college_data_numerical_state
 INNER JOIN state_key ON college_data_numerical_state.StateCode = state_key.StateCode);
 
 SELECT * FROM combined_TABLE;
 
 SELECT * INTO clean_TABLE
 FROM combined_TABLE;
 ALTER TABLE clean_TABLE 
 DROP COLUMN StateCode;
 SELECT * FROM clean_TABLE;
 
 ALTER TABLE clean_TABLE
 RENAME COLUMN StateLabel TO StateCode;
 
 SELECT * FROM clean_TABLE;
 
 
 CREATE TABLE MODEL_DATA(
 admit INT,
 gre FLOAT,
 gpa FLOAT,
 rank INT);
 
 SELECT * FROM model_data;
 
 SELECT MAX(gre) FROM model_data;
 SELECT MIN(gre) FROM model_data;
 SELECT MAX(gpa) FROM model_data;
 SELECT MIN(gpa) FROM model_data;
 SELECT MAX(rank) FROM model_data;
 SELECT MIN(rank) FROM model_data;
 
 SELECT COUNT(admit) FROM model_data
 WHERE admit = 0;
 
 SELECT COUNT(admit) FROM model_data
 WHERE admit = 1;
