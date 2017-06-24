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
	   join intuit_mdwdb.d_outage d on d.row_id = src.sys_id  AND d.source_id = src.sourceinstance
join intuit_mdwdb.f_outage tgt on tgt.row_id = src.sys_id  AND tgt.source_id = src.sourceinstance 	    
where coalesce(d.row_key,case when sys_id is null then 0 else -1 end)<>outage_c_key
