SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.sc_cat_item_final a
join cardinalhealth_mdwdb.d_master_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdwdb.d_internal_contact c
on c.row_id=concat('INTERNAL_CONTACT~',a.u_application_owner) and a.sourceinstance=c.source_id
where c.row_key<>b.application_owner_c_key;