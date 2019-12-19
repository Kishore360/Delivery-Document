SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.tpid_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) cnt from(select a.number,number_of_change_tasks,f.number_of_change_tasks_c from
  
(select b.number,b.sourceinstance,b.sys_id,count(a.number) number_of_change_tasks from png_mdsdb.change_task_final a 
join  png_mdsdb.change_request_final b on a.change_request=b.sys_id and a.sourceinstance=b.sourceinstance group by 1,2,3 )a
join png_mdwdb.d_change_request d on a.sys_id=d.row_id and a.sourceinstance=d.source_id
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key where d.soft_deleted_flag='N' and f.current_flag='Y' 
-- and change_request_number='CHG0209168' 
)a
where number_of_change_tasks<>number_of_change_tasks_c)b;




/*

select change_request_number, number_of_change_tasks_c
from png_mdwdb.d_change_request d 
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key where  current_flag='Y' and d.soft_deleted_flag='N' and 
change_request_number='CHG0204646';


select b.number,b.sourceinstance,b.sys_id,a.cdctype,b.cdctype,(a.number) number_of_change_tasks,a.cdctype,b.cdctype from png_mdsdb.change_task_final a 
join  png_mdsdb.change_request_final b on a.change_request=b.sys_id and a.sourceinstance=b.sourceinstance
where b.number='CHG0204646' ;*/
