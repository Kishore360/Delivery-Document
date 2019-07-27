SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.test_status_c' ELSE 'SUCCESS' END as Message
 from(SELECT count(1) as cnt 
 FROM
   png_mdsdb.us_dgtl_response_time_data_final SRC
 JOIN png_mdwdb.d_dgtl_response_time_c TRGT
ON concat (COALESCE(SRC.Test_Name,'UNSPECIFIED'),COALESCE(SRC.Date,'UNSPECIFIED')) = TRGT.row_id
WHERE SRC.Test_Status <> TRGT.test_status_c)ma;




