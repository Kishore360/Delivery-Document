SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.row_id' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.agent_skill_group_interval_final WHERE CDCTYPE<>'D') SRC 
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.agent_final WHERE CDCTYPE<>'D') af
on af.skilltargetid=SRC.skilltargetid and af.sourceinstance = SRC.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_call_summary TRGT 
	ON (CONCAT(SRC.skilltargetid, '~', coalesce(af.peripheralid,0), '~', SRC.skillgroupskilltargetid, '~', timezone, '~', trim(datetime))
    =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE CONCAT(SRC.skilltargetid, '~', coalesce(af.peripheralid,0), '~', SRC.skillgroupskilltargetid, '~', timezone, '~', trim(datetime))
<> COALESCE(TRGT.row_id ,'')