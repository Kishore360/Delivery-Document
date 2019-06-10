SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd_pivot_date' ELSE 'SUCCESS' END as Message
FROM (
select TRGT.PIVOT_DATE from 
 mercuryins_mdsdb.new_call_final SRC
  LEFT JOIN mercuryins_mdwdb.f_agent_non_acd TRGT
 ON (TRGT.row_id= SRC.sys_id
	AND SRC.sourceinstance =TRGT.source_id )
WHERE coalesce(SRC.opened_at,'') <> coalesce(TRGT.PIVOT_DATE,'') 
union
SELECT TRGT.PIVOT_DATE
FROM mercuryins_mdsdb.incident_final SRC 
LEFT JOIN mercuryins_mdwdb.f_agent_non_acd TRGT 
ON (SRC.sys_id = TRGT.row_id
AND SRC.sourceinstance =TRGT.source_id )
WHERE
coalesce(SRC.opened_at,'') <> coalesce(TRGT.PIVOT_DATE,''))PD
