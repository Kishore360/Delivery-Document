SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd_created_on' ELSE 'SUCCESS' END as Message
FROM (
select TRGT.CREATED_ON from  
 mercuryins_mdsdb.new_call_final SRC
  LEFT JOIN mercuryins_mdwdb.f_agent_non_acd TRGT
 ON (TRGT.row_id= SRC.sys_id
	AND SRC.sourceinstance =TRGT.source_id )
    LEFT JOIN  mercuryins_workdb.lsm_ls_source_timezone L 
	ON (SRC.sourceinstance = L.sourceid)
WHERE coalesce(CONVERT_TZ(sys_created_on,L.source_time_zone,L.target_time_zone),'') <> coalesce(TRGT.CREATED_ON,'')
union
select TRGT.CREATED_ON
FROM mercuryins_mdsdb.incident_final SRC 
LEFT JOIN mercuryins_mdwdb.f_agent_non_acd TRGT 
ON (SRC.sys_id = TRGT.row_id
AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN  mercuryins_workdb.lsm_ls_source_timezone L 
	ON (SRC.sourceinstance = L.sourceid)
WHERE
coalesce(CONVERT_TZ(sys_created_on,L.source_time_zone,L.target_time_zone),'') <> coalesce(TRGT.CREATED_ON,''))CRO