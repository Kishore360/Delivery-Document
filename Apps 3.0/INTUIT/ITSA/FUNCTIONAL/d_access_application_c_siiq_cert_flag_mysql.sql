SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.u_access_application_final d_cr 
JOIN intuit_mdwdb.d_access_application_c f_cr ON sys_id=row_id and sourceinstance=source_id
where
CASE
			WHEN d_cr.u_siiq_cert = 1
			 AND d_cr.u_type = 'Type2' THEN 'Y'
		ELSE 'N'
		END<>siiq_cert_flag
