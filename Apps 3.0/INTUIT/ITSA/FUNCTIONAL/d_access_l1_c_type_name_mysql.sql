SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for d_access_l1_c.type.name' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.u_access_l1_final i 
JOIN intuit_mdwdb.d_access_l1_c f_cr ON sys_id=row_id and sourceinstance=source_id
where
i.u_type<>f_cr.type or
		i.u_name<>f_cr.name