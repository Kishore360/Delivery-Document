SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.sc_cat_item_final a
join cardinalhealth_mdwdb.d_master_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where b.featured_item_c_flag<>case when a.u_featured_item=1 then 'Y' else 'N' end;