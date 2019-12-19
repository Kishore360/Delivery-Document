
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.tpid_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) cnt  from
  
(select b.number,b.sourceinstance,b.sys_id,coalesce(char_length(REPLACE(u_pg_technical_description_change,' ','')),0) abc,
pg_technical_description_change_count_c
 from 
  png_mdsdb.change_request_final b 
join png_mdwdb.d_change_request d on b.sys_id=d.row_id and b.sourceinstance=d.source_id
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key where current_flag='Y' and f.soft_deleted_flag='N')a
where abc<>pg_technical_description_change_count_c)b;


