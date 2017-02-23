SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
FROM
cardinalhealth_mdsdb.sys_user_final a
left join cardinalhealth_workdb.ds_internal_contact b
on (b.row_id =concat('INTERNAL_CONTACT~',a.sys_id) AND b.source_id=a.sourceinstance)
where b.manager_c_id<>COALESCE(concat('INTERNAL_CONTACT~',a.manager),'UNSPECIFIED'))temp;

