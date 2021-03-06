
				SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_change_failure.U_Weekly_Event_C' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt from 

ntrust_mdsdb.change_request_final  SRC 

JOIN ntrust_mdwdb.d_change_failure TRGT 
ON (SRC.sys_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id ) 
 
WHERE coalesce(case  
                    when SRC.u_weekly_event = 1 then 'Y' 
                    when SRC.u_weekly_event  = 0 then 'N' 
                    else  'X' 
                end,
                'X')  <> (TRGT.U_Weekly_Event_C) ) temp;