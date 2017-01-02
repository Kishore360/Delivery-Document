SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(1) as cnt
from usf_mdsdb.sc_item_option_mtom_final a

join usf_mdsdb.sc_item_option_final d

on a.sc_item_option=d.sys_id

and a.sourceinstance=d.sourceinstance
 
left join usf_mdwdb.f_request_item_variable_c b

on d.sys_id=b.row_id and

d.sourceinstance=b.source_id

left join usf_mdwdb.d_request_item c

on c.row_id=a.request_item

where c.row_key<>b.request_item_key
) x;

