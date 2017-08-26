SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd_day_key' ELSE 'SUCCESS' END as Message
FROM
(
 select TRGT.day_key from  
 cardinalhealth_mdsdb.new_call_final SRC
  LEFT JOIN cardinalhealth_mdwdb.f_agent_non_acd TRGT
 ON (TRGT.row_id= SRC.sys_id
	AND SRC.sourceinstance =TRGT.source_id )
 LEFT JOIN cardinalhealth_mdwdb.d_calendar_date LKP
  ON (DATE_FORMAT(SRC.opened_at,'%Y%m%d') = LKP.row_id
  and 0= LKP.source_id) 
WHERE coalesce(LKP.row_key,'') <> coalesce(TRGT.day_key,'')
union
select TRGT.day_key
FROM cardinalhealth_mdsdb.incident_final SRC 
LEFT JOIN cardinalhealth_mdwdb.f_agent_non_acd TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN cardinalhealth_mdwdb.d_calendar_date LKP 
ON (coalesce((DATE_FORMAT(SRC.opened_at,'%Y%m%d'))) = LKP.row_id
AND 0=LKP.source_id)
WHERE
coalesce(LKP.row_key,'') <> coalesce(TRGT.day_key,'')) DK


