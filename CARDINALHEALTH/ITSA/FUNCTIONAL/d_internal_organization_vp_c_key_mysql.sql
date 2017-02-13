SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdwdb.d_internal_organization a
JOIN cardinalhealth_mdsdb.sys_user_group_final b
 ON a.row_id=CONCAT('GROUP~',b.sys_id) AND a.source_id=b.sourceinstance
join
cardinalhealth_mdwdb.d_internal_organization lkp
on COALESCE(CONCAT('GROUP~',b.u_vp),'UNSPECIFIED')=lkp.row_id
 where coalesce(lkp.row_key,case when b.u_vp is null then 0 else -1 end )<> a.vp_c_key
 ;