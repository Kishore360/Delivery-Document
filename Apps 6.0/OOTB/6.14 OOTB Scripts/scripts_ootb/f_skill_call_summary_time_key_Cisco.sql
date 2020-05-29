SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.time_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.skill_group_interval_final WHERE CDCTYPE<>'D') SRC 
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.skill_group_final WHERE CDCTYPE<>'D') gf
on gf.skilltargetid=SRC.skilltargetid and gf.sourceinstance = SRC.sourceinstance
LEFT JOIN #DWH_TABLE_SCHEMA.f_skill_call_summary TRGT 
	ON (CONCAT(SRC.skilltargetid,'~',peripheralid,'~',timezone,'~',TRIM(datetime))
    =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
    left join #DWH_TABLE_SCHEMA.d_calendar_time cal
    on cal.row_id = DATE_FORMAT(datetime, '%h%i')
WHERE coalesce(cal.row_key,'') <> COALESCE(TRGT.time_key ,'')