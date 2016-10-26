
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt  
from coach_mdsdb.sc_cat_item_final a
left JOIN coach_mdwdb.d_master_item b
on  a.sys_id = b.ROW_ID and a.sourceinstance=b.source_id
left  JOIN  coach_mdwdb.d_configuration_item c
on a.u_configuration_item= c.row_id and a.sourceinstance=c.source_id
where 
case when u_configuration_item is NULL then 0 
when c.row_id is NULL and u_configuration_item is not NULL then -1 
else
c.row_key end <> b.configuration_item_c_key )a

