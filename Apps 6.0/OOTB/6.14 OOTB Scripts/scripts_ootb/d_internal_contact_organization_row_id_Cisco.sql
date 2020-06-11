
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.row_id' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.agent_team_member_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact_organization TRGT 
	ON  (concat(agentteamid,'~',skilltargetid) =TRGT.row_id  
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(concat(agentteamid,'~',skilltargetid) ,'')<> COALESCE(TRGT.row_id ,'')
