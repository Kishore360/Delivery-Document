
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.acd_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.skill_group_interval_final WHERE CDCTYPE<>'D') SRC 
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.skill_group_final WHERE CDCTYPE<>'D') gf
on gf.skilltargetid=SRC.skilltargetid and gf.sourceinstance = SRC.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_skill_call_summary TRGT 
	ON (CONCAT(SRC.skilltargetid,'~',peripheralid,'~',timezone,'~',TRIM(datetime))
    =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
	LEFT JOIN #DWH_TABLE_SCHEMA.d_acd LKP 
	ON (gf.peripheralid = LKP.row_id
	AND gf.sourceinstance = LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN peripheralid IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.acd_key,'')
