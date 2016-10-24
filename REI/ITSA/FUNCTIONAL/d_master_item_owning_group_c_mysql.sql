SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(1) as cnt
from rei_mdwdb.d_master_item a 
join rei_mdsdb.sc_cat_item_final b 
ON a.row_id = b.sys_id AND a.source_id = b.sourceinstance
where b.u_owning_group<>a.owning_group_c)c ;