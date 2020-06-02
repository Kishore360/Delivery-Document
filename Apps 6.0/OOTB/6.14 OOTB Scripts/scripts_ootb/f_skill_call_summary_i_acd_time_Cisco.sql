SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.i_acd_time' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.skill_group_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.skill_group_interval_final WHERE CDCTYPE<>'D') gf
ON gf.skilltargetid = SRC.skilltargetid  and SRC.sourceinstance=gf.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_skill_call_summary TRGT 
	ON (CONCAT(gf.skilltargetid,'~',SRC.peripheralid,'~',timezone,'~',TRIM(datetime))=TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE -- COALESCE(SRC.i_acdtime,'')
(coalesce(gf.talkintime,0) + coalesce(gf.talkouttime,0)+ coalesce(gf.talkothertime,0) + coalesce(gf.talkautoouttime,0) + coalesce(gf.talkpreviewtime,0)  + coalesce(gf.talkreservetime ,0)
)
<> COALESCE(TRGT.i_acd_time,'')