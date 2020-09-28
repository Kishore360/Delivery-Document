		

			SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.lead_time_c' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 

ntrust_mdsdb.change_request_final  SRC 

JOIN ntrust_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 
WHERE CASE 
                    WHEN (SRC.work_start is null 
                    and SRC.start_date is null) 
                    or SRC.sys_created_on is null then 0 
                    WHEN COALESCE(SRC.work_start,
                    SRC.start_date)  >  SRC.sys_created_on then TIMESTAMPDIFF(SECOND,
                    SRC.sys_created_on,
                    COALESCE(SRC.work_start,
                    SRC.start_date)) 
                    else 0  
                end  <> (TRGT.lead_time_c) ) temp;	