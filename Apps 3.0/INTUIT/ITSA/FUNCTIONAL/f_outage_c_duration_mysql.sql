SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
	   from intuit_mdsdb.cmdb_ci_outage_final src
join intuit_mdwdb.f_outage_c tgt on tgt.row_id = src.sys_id  AND tgt.source_id = src.sourceinstance 
	   where tgt.duration <> TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.duration)