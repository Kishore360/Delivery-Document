
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.allocation_end_on_key' ELSE 'SUCCESS' END as Message
FROM (select S.*,cd.calendar_date,date_add(S.start_date, interval timestampdiff(day,S.start_date,cd.calendar_date) day) as allocation_end_on
from <<tenant>>_mdsdb.resource_allocation_final S 
JOIN <<tenant>>_mdwdb.d_calendar_date cd ON cd.calendar_date BETWEEN S.start_date AND S.end_date
WHERE cd.week_day_flag = 'Y') SRC

LEFT JOIN <<tenant>>_mdwdb.d_calendar_date LKP 
 ON ( date_format(SRC.allocation_end_on,'%Y%m%d') = LKP.row_id 
AND 0= LKP.source_id )

LEFT JOIN <<tenant>>_mdwdb.f_resource_allocation TRGT 
ON (concat(SRC.sys_id,'~', date_format(SRC.calendar_date,'%Y%m%d'))  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.end_date IS NULL THEN '' else '-1' end)<> COALESCE(TRGT.allocation_end_on_key,'')
