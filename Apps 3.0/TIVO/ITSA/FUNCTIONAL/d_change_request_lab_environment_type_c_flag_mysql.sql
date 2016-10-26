SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.work_start_on_key' 
ELSE 'SUCCESS' END as Message from 
(select a.sys_id  ,a.sourceinstance,group_concat(d.u_environment_type) as u_environment_type
 FROM tivo_mdsdb.change_request_final a
 LEFT JOIN tivo_mdsdb.task_ci_final b ON a.sys_id = b.task
 JOIN tivo_mdsdb.cmdb_ci_final c ON b.ci_item = c.sys_id 
 Join tivo_mdsdb.cmdb_ci_environment_final d on d.sys_id=c.sys_id 
 group by  a.sys_id,a.sourceinstance)x

 LEFT  JOIN tivo_mdwdb.d_change_request TRGT 
 ON (x.sys_id =TRGT.row_id  
 AND x.sourceinstance= TRGT.source_id )
 
where case when x.u_environment_type like '%lab%' then 'Y' else 'N' end<> TRGT.lab_environment_type_c_flag