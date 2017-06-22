 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
svb_mdsdb.incident_final src
join 
svb_mdwdb.d_incident c
on src.sys_id=c.row_id
join svb_mdwdb.d_lov lkp
on COALESCE( CONCAT('CATEGORY','~','INCIDENT','~','~','~',upper(src.category )),'UNSPECIFIED') = lkp.row_id 
where  coalesce(lkp.row_key,case when src.category is null then 0 else -1 end)<>c.category_src_key
 )c
