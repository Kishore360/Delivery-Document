
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_survey_iyl_c.survey_type_iyl_c_key' ELSE 'SUCCESS' END as Message 
 
FROM png_mdsdb.us_survey_id_data_c_final  SRC 
JOIN png_mdwdb.d_survey_iyl_c TRGT ON 
(SRC.id= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
LEFT OUTER JOIN png_mdsdb.us_survey_history_mapping_c_final survey_history_mapping_c 
ON SRC.id = survey_history_mapping_c.Survey_ID     
LEFT OUTER JOIN png_mdwdb.d_lov LKP 
ON     CASE   WHEN survey_history_mapping_c.Survey_ID IS NULL  THEN IF (substring_index(substring_index(SRC.title,':',-4), ':',1) ='Post-3months',CONCAT('TYPE_IYL~SURVEY~Post-3m'),
                    COALESCE(CONCAT('TYPE_IYL~SURVEY~', substring_index(substring_index(SRC.title,':',
                    -4),':', 1)),'UNSPECIFIED')  )   ELSE COALESCE(CONCAT('TYPE_IYL~SURVEY~',survey_history_mapping_c.Survey_Type),'UNSPECIFIED') 
                END = LKP.row_id and LKP.source_id =  SRC.sourceinstance

WHERE COALESCE(LKP.row_key,-1)   <> (TRGT.survey_type_iyl_c_key) and TRGT.soft_deleted_flag ='N'
