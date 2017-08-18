SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     
intuit_mdwdb.d_configuration_item a
JOIN intuit_mdsdb.cmdb_ci_final b ON a.row_id =b.sys_id
 AND a.source_id=b.sourceinstance
join intuit_mdwdb.d_application d
	on COALESCE(concat('APPLICATION~',b.sys_id) ,'UNSPECIFIED') = d.row_id
	where
coalesce(d.row_key,case when b.sys_id is null then 0 else -1 end )<>a.change_control_c_key 