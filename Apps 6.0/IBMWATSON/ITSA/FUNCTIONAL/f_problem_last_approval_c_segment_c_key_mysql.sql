SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_problem.last_approval_duration_c' ELSE 'SUCCESS' END as Message
from  ibmwatson_mdwdb.f_problem_last_approval_c a
JOIN ibmwatson_mdsdb.problem_final b ON a.row_id = b.sys_id and a.source_id = b.sourceinstance
join ibmwatson_mdsdb.cmdb_ci_final a1 on b.cmdb_ci=a1.sys_id and a1.sourceinstance=2
join ibmwatson_mdwdb.d_tribe_c d on a1.u_tribe=d.row_id and a1.sourceinstance=d.source_id and a1.cdctype<>'D'
JOIN ( SELECT documentkey,sourceinstance,max(sys_created_on) as created_on from 
ibmwatson_mdsdb.sys_audit_final 
where tablename ='problem' and fieldname ='state' and  newvalue =7
group by 1,2
) X
ON a.row_id = X.documentkey and a.source_id = X.sourceinstance
where a.segment_c_key<>d.segment_c_key)a;