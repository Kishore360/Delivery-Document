
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 
'MDS to DWH data validation failed for f_walk_up_c.walk_up_c_key' ELSE 'SUCCESS' END as Message 
FROM pan_mdsdb.u_walk_up_final SRC 
LEFT JOIN pan_mdwdb.f_walk_up_c TRGT 
ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
join pan_mdwdb.d_walk_up_c lkp
on SRC.sys_id=lkp.row_id and SRC.sourceinstance = lkp.source_id
WHERE coalesce(lkp.row_key,case when SRC.sys_id is NULL
then 0 else -1 end) <> TRGT.walk_up_c_key


