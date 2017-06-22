 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdwdb.d_product_model f
join svb_mdsdb.cmdb_model_final as pf
on f.row_id = pf.sys_id and f.source_id = pf.sourceinstance 
where  pf.short_description<>f.short_desc

 )c
		