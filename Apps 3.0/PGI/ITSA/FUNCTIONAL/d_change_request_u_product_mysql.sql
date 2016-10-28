SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 

ELSE 'Data Matched' END AS Message 
from
(
select a.product_name_c, c.u_name

from  pgi_mdwdb.d_change_request a

JOIN pgi_mdsdb.change_request_final b

on a.row_id=b.sys_id

and a.source_id=b.sourceinstance

LEFT JOIN pgi_mdsdb.u_pgi_product_list_final c

on b.u_product=c.sys_id

where  

case when  a.product_name_c  is NULL then a.product_name_c = 'Non-Product'   
when  (c.u_active=1 or c.u_change_management_option=1) then trim(a.product_name_c) end <> trim(c.u_name)  ) f