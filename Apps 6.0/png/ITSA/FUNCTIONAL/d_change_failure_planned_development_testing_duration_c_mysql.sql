SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.tpid_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) cnt  from(
   select number, 
   substring_index( timestampdiff(day,u_pg_planned_development_start,u_pg_planned_development_end) ,".",1)
  +substring_index( timestampdiff(day,u_pg_planned_testing_start,u_pg_planned_testing_end) ,".",1)
planned_development_duration,f.planned_development_testing_duration_c planned_development_testing_duration_c
FROM png_mdsdb.change_request_final
join png_mdwdb.d_change_request d on sys_id=row_id and sourceinstance=source_id
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key  and  f.current_flag='Y' and d.soft_deleted_flag='N')a
where planned_development_duration<>planned_development_testing_duration_c 
)b


