SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
from intuit_mdsdb.u_access_environments_final src
join intuit_mdwdb.d_access_environments_c tgt on tgt.row_id = src.sys_id  AND tgt.source_id = src.sourceinstance 
where u_environment <> environment