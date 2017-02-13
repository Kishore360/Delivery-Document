SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.rm_defect SRC
 LEFT JOIN cardinalhealth_mdwdb.f_defect_rm_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN cardinalhealth_mdwdb.d_calendar_date LKP 
on (LKP.row_id = date_format(convert_tz(SRC.opened_at,'GMT','America/New_York'),'%Y%m%d')  and LKP.source_id=0
)
WHERE COALESCE(LKP.row_key,'') <> COALESCE(TRGT.opened_c_key,'') 