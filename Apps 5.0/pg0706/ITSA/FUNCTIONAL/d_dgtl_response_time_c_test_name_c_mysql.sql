SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.test_name_c' ELSE 'SUCCESS' END as Message
 FROM
   png_mdsdb.us_dgtl_response_time_data_final SRC
 JOIN png_mdwdb.d_dgtl_response_time_c TRGT
ON concat (COALESCE(SRC.Test_Name,'UNSPECIFIED'),COALESCE(SRC.Date,'UNSPECIFIED')) = TRGT.row_id
WHERE SRC.Test_Name <> TRGT.test_name_c;




