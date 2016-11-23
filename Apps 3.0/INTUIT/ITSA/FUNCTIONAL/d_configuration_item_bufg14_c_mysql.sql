SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
from
intuit_mdwdb.d_configuration_item a
JOIN intuit_mdsdb.cmdb_ci_final b ON a.row_id =b.sys_id
 AND a.source_id=b.sourceinstance
LEFT JOIN intuit_mdsdb.u_bufg_final c ON b.u_bufg_l2=c.sys_id
LEFT JOIN intuit_mdsdb.u_bufg_final d ON b.u_bufg_l3=d.sys_id
LEFT JOIN intuit_mdsdb.u_bufg_final e ON b.u_bufgl4=e.sys_id
where a.bufg14_c<>e.u_name