
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_question_iyl_c.metric1_iyl_c_key' ELSE 'SUCCESS' END as Message 
 
FROM png_mdsdb.us_question_master_iyl_c_final  SRC 
JOIN png_mdwdb.d_question_iyl_c TRGT ON 
(SHA1(CONCAT(SRC.English_Question_Text,'~',SRC.Metric))= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
LEFT OUTER JOIN png_mdwdb.d_lov LKP 
ON   CONCAT('METRIC1_IYL~SURVEY_QUESTION~',SRC.Metric) = LKP.row_id and LKP.source_id =  SRC.sourceinstance

WHERE  CASE WHEN SRC.Metric IS NULL THEN 0 ELSE COALESCE(LKP.row_key,-1) END  <> (TRGT.metric1_iyl_c_key) and TRGT.soft_deleted_flag ='N'