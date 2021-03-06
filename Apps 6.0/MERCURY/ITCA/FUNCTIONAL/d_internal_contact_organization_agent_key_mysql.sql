SELECT
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.agent id' ELSE 'SUCCESS' END as Message
FROM mercury_mdsdb.agroups_final SRC 
LEFT JOIN mercury_mdwdb.d_internal_contact_organization TRGT 
 ON (concat(acd_no,'~',trim(item_name),'~',value) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id ) 
LEFT JOIN mercury_mdwdb.d_agent INTCONT
 ON (CONCAT(SRC.acd_no,'~',SRC.value) = INTCONT.row_id
 AND SRC.sourceinstance =INTCONT.source_id )
WHERE COALESCE(INTCONT.row_key, case when COALESCE(SRC.acd_no,SRC.value) is null then 0 else -1 end) <> TRGT.agent_key 
