SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.inbound_acw_time' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.agent_final WHERE CDCTYPE<>'D') SRC
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.agent_skill_group_interval_final WHERE CDCTYPE<>'D') gf
on gf.skilltargetid=SRC.skilltargetid and gf.sourceinstance = SRC.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_call_summary TRGT 
	ON (CONCAT(gf.skilltargetid, '~', coalesce(peripheralid,0), '~', skillgroupskilltargetid,'~', timezone, '~', trim(datetime))  =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE -- COALESCE(acwtime + da_acwtime - o_acwtime ,'')
coalesce(gf.handledcallstime-gf.handledcallstalktime- gf.incomingcallsonholdtime,0) 
<> COALESCE(TRGT.inbound_acw_time,'')