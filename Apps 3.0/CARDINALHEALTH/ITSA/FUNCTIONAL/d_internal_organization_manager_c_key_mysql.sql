SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from cardinalhealth_mdwdb.d_internal_organization a
JOIN cardinalhealth_mdsdb.sys_user_group_final b
 ON a.row_id=CONCAT('GROUP~',b.sys_id) AND a.source_id=b.sourceinstance
join cardinalhealth_mdwdb.d_internal_organization lkp
on COALESCE(CONCAT('GROUP~',b.manager),'UNSPECIFIED')=lkp.row_id -- and lkp.source_id=b.sourceinstance
 where  coalesce(lkp.row_key,case when b.manager is null then 0 else -1 end) <> a.manager_c_key)temp;
 