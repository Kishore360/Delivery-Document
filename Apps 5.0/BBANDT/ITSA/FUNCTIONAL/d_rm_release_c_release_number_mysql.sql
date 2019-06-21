SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'Data mismatch' ELSE 'SUCCESS' END as Message
-- select src.sys_id, trgt.row_id,src.number,trgt.release_number
FROM bbandt_mdwdb.d_rm_release_c trgt
RIGHT JOIN bbandt_mdsdb.rm_release_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where src.number<>trgt.release_number;