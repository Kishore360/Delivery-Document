
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.da_other_time' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.agent_skill_group_interval_final WHERE CDCTYPE<>'D') SRC 
left join #DWH_TABLE_SCHEMA.agent_final af
on af.skilltargetid=SRC.skilltargetid and af.sourceinstance = SRC.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_call_summary TRGT 
	ON (CONCAT(SRC.skilltargetid, '~', coalesce(af.peripheralid,0), '~', SRC.skillgroupskilltargetid, '~', timezone, '~', trim(datetime))
    =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.da_othertime,'')<> COALESCE(TRGT.da_other_time,'')
