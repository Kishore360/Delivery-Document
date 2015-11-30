SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.expected_start_on_key' ELSE 'SUCCESS' END as Message
 FROM ucsf_mdsdb.change_request_final SRC
 LEFT JOIN ucsf_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) LEFT JOIN ucsf_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.expected_start,'GMT','America/Los_Angeles'),'%Y%m%d') and LKP.source_id=0 
)
 WHERE LKP.row_key<> TRGT.expected_start_on_key
