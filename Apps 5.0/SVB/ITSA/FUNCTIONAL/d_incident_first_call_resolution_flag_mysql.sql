SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_problem.resolution_code_src_c_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
FROM svb_mdwdb.d_incident d
JOIN svb_mdsdb.incident_final f ON d.row_id = f.sys_id and d.source_id=f.sourceinstance
where CASE WHEN f.u_fcr = 1 THEN  'Y' ELSE 'N' END <>d.first_call_resolution_flag
)b