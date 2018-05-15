SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_clarity_time_data_c.task_work_type_id_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_clarity_time_data_c trgt
RIGHT JOIN bbandt_mdsdb.bbt_time_data_v_final src
on src.row_num = trgt.row_id and src.sourceinstance = trgt.source_id
where trgt.task_work_type_id_c <>src.task_work_type_id;