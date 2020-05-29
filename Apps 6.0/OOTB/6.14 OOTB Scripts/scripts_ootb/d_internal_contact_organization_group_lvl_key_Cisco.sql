

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_contact_organization.group lvl id' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.agent_team_member_final WHERE CDCTYPE<>'D') SRC2
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.agent_final WHERE CDCTYPE<>'D') SRC1
 on (SRC1.skilltargetid = SRC2.skilltargetid  and SRC1.sourceinstance = SRC2.sourceinstance)
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact_organization TRGT 
 ON (concat(SRC2.agentteamid,'~',SRC2.skilltargetid) =TRGT.row_id
 AND SRC1.sourceinstance =TRGT.source_id ) 
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization INTORG
 ON (CONCAT('GROUP_LEVEL~',SRC2.agentteamid) = INTORG.row_id
 AND INTORG.source_id =SRC2.sourceinstance )
WHERE COALESCE( INTORG.row_key,-1) <> COALESCE(TRGT.group_lvl_key ,'')