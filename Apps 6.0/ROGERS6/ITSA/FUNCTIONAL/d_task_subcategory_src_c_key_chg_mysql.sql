SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_task.subcategory_src_c_key' ELSE 'SUCCESS' END as Message
FROM rogersdev6_mdsdb.change_request_final SRC
JOIN (select d.row_id,d.source_id,d.subcategory_src_c_key from rogersdev6_mdwdb.d_task d
join rogersdev6_mdwdb.d_lov l on d.task_type_src_key=l.row_key where l.dimension_name='Request For Change') TRGT
ON SRC.sys_id= TRGT.row_id AND SRC.sourceinstance = TRGT.source_id and SRC.cdctype<>'D'
JOIN rogersdev6_mdwdb.d_change_request LKP ON SRC.sys_id=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.subcategory_src_c_key,case when SRC.u_subcategory is null then 0 else -1 end)<> (TRGT.subcategory_src_c_key);