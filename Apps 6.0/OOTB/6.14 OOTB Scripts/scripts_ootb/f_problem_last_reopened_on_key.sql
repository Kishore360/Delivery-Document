SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.last_reopened_on_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN (select * from #DWH_TABLE_SCHEMA.f_problem)TRGT 
ON (SRC.sys_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
INNER join (select max(reopened_time)  reopened_date,problem_id from #MDS_TABLE_SCHEMA.incident_final where  cdctype<>'D'
group by problem_id)SRC1
on SRC1.problem_id=TRGT.row_id
where coalesce(date_format(COALESCE(convert_tz(SRC1.reopened_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')),'%Y%m%d'))<> COALESCE(TRGT.last_reopened_on_key,'')




