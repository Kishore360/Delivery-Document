
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_survey_iyl_c.language_c' ELSE 'SUCCESS' END as Message 
 
FROM png_mdsdb.us_survey_id_data_c_final  SRC 
JOIN png_mdwdb.d_survey_iyl_c TRGT ON 
(SRC.id= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
LEFT OUTER JOIN png_mdsdb.us_survey_history_mapping_c_final survey_history_mapping_c 
ON SRC.id = survey_history_mapping_c.Survey_ID     

WHERE   
CASE 
WHEN survey_history_mapping_c.Survey_ID is NULL THEN   str_to_date(substring_index(substring_index(SRC.title, ':',-1),':',1),'%d-%m-%y')   ELSE str_to_date(survey_history_mapping_c.Date,'%d-%m-%y')   END   <> (TRGT.survey_date_c) and TRGT.soft_deleted_flag ='N'
