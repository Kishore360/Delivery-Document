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
JOIN intuit_mdwdb.d_internal_organization d_cr ON COALESCE(CONCAT('GROUP~',i.change_control),'UNSPECIFIED')=row_id and sourceinstance=source_id
join intuit_mdwdb.d_configuration_application_c f_cr  on sys_id=f_cr.row_id and sourceinstance=f_cr.source_id
where
coalesce(d_cr.row_key,case when change_control is null then 0 else -1 end )<>f_cr.change_control_key 