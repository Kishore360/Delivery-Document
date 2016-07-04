SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.lead_time' ELSE 'SUCCESS' END as Message
 FROM <<tenant>>_mdsdb.change_request_final SRC 
 
 LEFT JOIN <<tenant>>_mdwdb.f_change_request TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
where
case when COALESCE(SRC.work_start,SRC.start_date)>SRC.sys_created_on and   COALESCE(SRC.work_start,SRC.start_date) is not null THEN
TIMESTAMPDIFF(SECOND,SRC.sys_created_on,COALESCE(SRC.work_start,SRC.start_date)) 
ELSE 0 end
<> TRGT.lead_time 

