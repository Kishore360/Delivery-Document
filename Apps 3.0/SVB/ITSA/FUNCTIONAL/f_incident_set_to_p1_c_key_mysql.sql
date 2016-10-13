SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.incident_final SRC
 LEFT JOIN svb_mdwdb.f_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  ) 
 LEFT JOIN svb_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.u_set_to_p1,'GMT','America/Los_Angeles'),'%Y%m%d') and LKP.source_id=0 
)
 WHERE LKP.row_key<> TRGT.set_to_p1_c_key
