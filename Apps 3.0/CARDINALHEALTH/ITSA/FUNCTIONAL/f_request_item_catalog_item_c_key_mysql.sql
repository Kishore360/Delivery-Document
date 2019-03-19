SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
cardinalhealth_mdsdb.sc_req_item_final a
join cardinalhealth_mdwdb.f_request_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdwdb.d_lov c
on c.row_id=COALESCE( CONCAT('CATALOG_ITEM_C','~','SC_REQ_ITEM','~','~','~',UPPER(a.u_new_catalog_item )),'UNSPECIFIED') 
and c.source_id=a.sourceinstance
where COALESCE(c.row_key,CASE WHEN a.u_new_catalog_item IS NULL THEN 0 else -1 end)<>b.catalog_item_c_key;