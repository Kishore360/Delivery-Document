
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.user_type' ELSE 'SUCCESS' END as Message
  FROM (select S.*,cd.calendar_date  from <<tenant>>_mdsdb.resource_allocation_final S 
JOIN <<tenant>>_mdwdb.d_calendar_date cd ON cd.calendar_date BETWEEN S.start_date AND S.end_date
WHERE cd.week_day_flag = 'Y') SRC
JOIN <<tenant>>_mdsdb.resource_plan_final  RP        
ON SRC.resource_plan = RP.sys_id   AND   SRC.sourceinstance = RP.sourceinstance
LEFT JOIN <<tenant>>_mdwdb.f_resource_allocation TRGT 
ON (concat(SRC.sys_id,'~', date_format(SRC.calendar_date,'%Y%m%d'))  =TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( case when group_resource is not null then 'USER GROUP' else 'USER' end ,'')<> COALESCE(TRGT.user_type ,'')
