SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdsdb.problem_final i 
JOIN intuit_mdwdb.d_problem d_cr ON COALESCE(CONCAT('CLOSE_CODE~PROBLEM','~','~','~',UPPER(i.u_close_code)),'UNSPECIFIED')=row_id and i.sourceinstance=source_id
join intuit_mdwdb.f_problem f_cr  on i.sys_id=f_cr.row_id and i.sourceinstance=f_cr.source_id
where
coalesce(d_cr.row_key,case when u_close_code is null then 0 else -1 end )<>f_cr.close_code_src_c_key 