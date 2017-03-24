SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
FROM  (select count(1) as cnt 
from asu_mdsdb.sc_item_option_final b 
join asu_mdsdb.sc_item_option_mtom_final d on d.sc_item_option=b.sys_id
join asu_mdwdb.d_variable_c f on b.item_option_new=f.row_id and b.sourceinstance=f.source_id
join asu_mdwdb.f_request_item_variable_c a 
on SUBSTRING(a.row_id,1,32)= b.sys_id AND SUBSTRING(a.row_id,34,32)=  d.request_item
AND a.source_id=b.sourceinstance WHERE f.row_key <>a.variable_c_key)a

