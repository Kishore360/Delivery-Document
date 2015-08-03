SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdwdb.d_internal_contact a
join cardinalhealth_mdsdb.sys_user_final b
on a.row_id=b.sys_id AND a.source_id=b.sourceinstance
left join cardinalhealth_mdwdb.d_internal_contact c
on c.row_id=COALESCE(concat('INTERNAL_CONTACT~',b.u_vp),'UNSPECIFIED')AND c.source_id=b.sourceinstance
where a.vp_c_key<>COALESCE(CASE WHEN(COALESCE(concat('INTERNAL_CONTACT~',b.u_vp),'UNSPECIFIED'))='UNSPECIFIED' THEN 0 ELSE c.row_key END,-1);
