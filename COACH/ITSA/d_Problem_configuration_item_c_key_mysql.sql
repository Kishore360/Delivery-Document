SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from coach_mdsdb.sc_cat_item_final a
 left JOIN  coach_mdwdb.d_master_item b
on  b.ROW_ID = a.SYS_ID and a.sourceinstance=b.source_id
 left join coach_mdwdb.d_configuration_item c 
on  a.u_configuration_item=c.row_id 
 where 
c.row_key <>b.configuration_item_c_key )b
