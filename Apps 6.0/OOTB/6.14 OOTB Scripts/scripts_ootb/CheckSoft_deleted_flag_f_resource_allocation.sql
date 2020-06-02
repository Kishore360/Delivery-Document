
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for f_resource_allocation' ELSE 'SUCCESS' END as Message
FROM (select S.sys_id, S.cdctype,S.sourceinstance from  #MDS_TABLE_SCHEMA.resource_allocation_final S 
JOIN #DWH_TABLE_SCHEMA.d_calendar_date cd ON cd.calendar_date BETWEEN S.start_date AND S.end_date
WHERE cd.week_day_flag = 'Y') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_resource_allocation TRGT 
ON (SRC.sys_id=TRGT.source_row_id 
AND SRC.sourceinstance=TRGT.source_id 
)
WHERE CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
