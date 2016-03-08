SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.closed_on_key' ELSE 'SUCCESS' END as Message 
FROM asu_mdsdb.kb_knowledge_final SRC
 LEFT JOIN asu_mdwdb.f_kb_knowledge_c  TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN asu_mdwdb.d_calendar_date LKP 
on (LKP.row_id=date_format(convert_tz(SRC.valid_to
 ,'GMT','US/Mountain') ,'%Y%m%d') )
WHERE  LKP.row_key<>TRGT.valid_to_c_key








