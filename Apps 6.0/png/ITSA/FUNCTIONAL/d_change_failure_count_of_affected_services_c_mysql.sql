SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.tpid_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) cnt from(select a.number,count_of_affected_services,count_of_affected_services_c from
  
(select b.number,b.sourceinstance,b.sys_id,count(a.cmdb_ci_service) count_of_affected_services from png_mdsdb.task_cmdb_ci_service_final a 
join  png_mdsdb.change_request_final b on a.task=b.sys_id and a.sourceinstance=b.sourceinstance group by 1,2 )a
join png_mdwdb.d_change_request d on a.sys_id=d.row_id and a.sourceinstance=d.source_id
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key where current_flag='Y' )a
where count_of_affected_services<>count_of_affected_services_c)b;