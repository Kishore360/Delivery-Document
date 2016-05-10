SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select
count(*) as cnt
from  nbcu_mdwdb.d_master_item a11
left join nbcu_mdsdb.sc_cat_item_final a12
on a11.row_id=a12.sys_id and a11.source_id=a12.sourceinstance
left join nbcu_mdsdb.sys_user_final a13
on a12.u_catalog_item_owner=a13.sys_id
where a13.name<>a11.catalog_item_owner_c)a
