SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.cmdb_ci_appl_final i 
JOIN intuit_mdwdb.d_domain d_cr ON sys_domain=row_id and sourceinstance=source_id
join intuit_mdwdb.d_configuration_application_c f_cr  on sys_id=f_cr.row_id and sourceinstance=f_cr.source_id
where
coalesce(d_cr.row_key,case when sys_domain is null then 0 else -1 end )<>f_cr.domain_key 