	
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
     rogers_mdwdb.d_problem d 
JOIN rogers_mdsdb.problem_final p ON d.row_id=p.sys_id
where 		
			CONVERT_TZ (u_rca_end,
            'GMT',
            'America/New_York') <> u_rca_end_c