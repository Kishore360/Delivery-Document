SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd_created_on' ELSE 'SUCCESS' END as Message
FROM (
select TRGT.CREATED_ON from  
 mercuryins_mdsdb.new_call_final SRC
  LEFT JOIN mercuryins_mdwdb.f_agent_non_acd TRGT
 ON (TRGT.row_id= SRC.sys_id
	AND SRC.sourceinstance =TRGT.source_id )
WHERE CONVERT_TZ(sys_created_on,'GMT','America/Los_Angeles') <> TRGT.CREATED_ON
union
select TRGT.CREATED_ON
FROM mercuryins_mdsdb.incident_final SRC 
LEFT JOIN mercuryins_mdwdb.f_agent_non_acd TRGT 
ON (SRC.sys_id = TRGT.row_id
AND SRC.sourceinstance =TRGT.source_id )
WHERE
CONVERT_TZ(sys_created_on,'GMT','America/Los_Angeles') <> TRGT.CREATED_ON)CRO