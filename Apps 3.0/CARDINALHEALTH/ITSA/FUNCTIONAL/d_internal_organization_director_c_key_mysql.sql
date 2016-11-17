SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from cardinalhealth_mdwdb.d_internal_organization a
JOIN cardinalhealth_mdsdb.sys_user_group_final b
 ON a.row_id=CONCAT('GROUP~',b.sys_id) AND a.source_id=b.sourceinstance
join
cardinalhealth_mdsdb.sys_user_final lkp1 ON b.manager= lkp1.sys_id
join cardinalhealth_mdwdb.d_internal_contact lkp
on COALESCE(CONCAT('INTERNAL_CONTACT~',lkp1.u_director),'UNSPECIFIED')=lkp.row_id and lkp.source_id=b.sourceinstance
 where  coalesce(lkp.row_key,case when lkp1.u_director is null then 0 else -1 end) <> a.director_c_key ;