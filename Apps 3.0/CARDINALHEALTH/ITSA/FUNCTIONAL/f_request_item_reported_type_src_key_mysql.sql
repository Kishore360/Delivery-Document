SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdsdb.sc_req_item_final a
join cardinalhealth_mdwdb.f_request_item b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdwdb.d_lov c
on c.row_id=COALESCE(CONCAT('CONTACT_TYPE','~','TASK','~','~','~',upper(a.contact_type)),'UNSPECIFIED') 
and c.source_id=a.sourceinstance
where COALESCE(c.row_key,CASE WHEN a.contact_type IS NULL THEN 0 else -1 end)<>b.reported_type_src_key)c;