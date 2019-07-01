SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd_created_by' ELSE 'SUCCESS' END as Message
FROM (
select TRGT.CREATED_BY from 
 mercuryins_mdsdb.new_call_final SRC
  LEFT JOIN mercuryins_mdwdb.f_agent_non_acd TRGT
 ON (TRGT.row_id= SRC.sys_id
	AND SRC.sourceinstance =TRGT.source_id )
WHERE coalesce(SRC.sys_created_by,'' )<> coalesce(TRGT.CREATED_BY,'')
union
SELECT TRGT.CREATED_BY
FROM mercuryins_mdsdb.incident_final SRC 
LEFT JOIN mercuryins_mdwdb.f_agent_non_acd TRGT 
ON (SRC.sys_id = TRGT.row_id
AND SRC.sourceinstance =TRGT.source_id )
WHERE
coalesce(sys_created_by,'') <> coalesce(TRGT.CREATED_BY,''))CRB