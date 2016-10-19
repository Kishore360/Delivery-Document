
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'soft_deleted_flag not correct for f_resource_allocation' ELSE 'SUCCESS' END as Message
FROM (select S.sys_id, S.cdctype,S.jobid,S.sourceinstance from <<tenant>>_mdsdb.resource_allocation_bwd_delta S 
JOIN <<tenant>>_mdwdb.d_calendar_date cd ON cd.calendar_date BETWEEN S.start_date AND S.end_date
WHERE cd.week_day_flag = 'Y') SRC
LEFT JOIN <<tenant>>_mdwdb.f_resource_allocation TRGT 
ON (SRC.sys_id=TRGT.source_row_id 
AND SRC.sourceinstance=TRGT.source_id 
)
WHERE SRC.jobid =(select max(jobid) from <<tenant>>_mdsdb.resource_allocation_bwd_delta 
WHERE sys_id = SRC.sys_id) AND SRC.cdctype <>'I'
AND CASE WHEN SRC.cdctype='A' THEN 'Y' ELSE 'N' END <> COALESCE(TRGT.soft_deleted_flag ,'')
