SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.u_bufg_final i 
JOIN intuit_mdwdb.d_bufg_c f_cr ON sys_id=row_id and sourceinstance=source_id
where
i.u_logical_org_group<>f_cr.logical_org_group or
		i.u_name<>f_cr.name