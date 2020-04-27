
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_question_iyl_c.german_question_c' ELSE 'SUCCESS' END as Message 
 
FROM png_mdsdb.us_question_master_iyl_c_final  SRC 
JOIN png_mdwdb.d_question_iyl_c TRGT ON 
(SHA1(CONCAT(SRC.English_Question_Text,'~',SRC.Metric))= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 


WHERE  COALESCE(SRC.German_Question_Text,'UNSPECIFIED') <> (TRGT.german_question_c) and TRGT.soft_deleted_flag ='N'