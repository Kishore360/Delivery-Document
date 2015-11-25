SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(1)
 as cnt
from rei_mdsdb.sc_item_option_final a

left join rei_mdwdb.f_request_item_variable_c b

on a.sys_id=b.row_id and

a.sourceinstance=b.source_id

left join rei_mdwdb.d_variable c

on c.row_id=a.item_option_new

where c.row_key<>b.variable_c_key) z;