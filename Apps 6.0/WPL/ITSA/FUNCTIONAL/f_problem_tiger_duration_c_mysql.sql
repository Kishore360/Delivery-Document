SELECT CASE WHEN CNT>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for f_problem.tiger_duration_c' ELSE 'SUCCESS' END as Message 
FROM
(select count(1) as CNT from wpl_mdwdb.f_problem a11
left join wpl_mdsdb.problem_final der
 on  a11.row_id=der.sys_id and a11.source_id=der.sourceinstance
 where  (a11.tiger_duration_c<>case when timestampdiff(second,CONVERT_TZ(sys_created_on ,'GMT','America/New_York'),CONVERT_TZ(u_rca_ready_time,'GMT','America/New_York'))<0 then 0
else timestampdiff(second,CONVERT_TZ(sys_created_on ,'GMT','America/New_York'),CONVERT_TZ(u_rca_ready_time,'GMT','America/New_York')) end )
and der.cdctype<>'D')der;