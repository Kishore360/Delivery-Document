SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(*) as cnt 
from rei_mdwdb.d_incident a 
join rei_mdsdb.incident_final b 
on (a.row_id=b.sys_id and a.source_id=b.sourceinstance)
join
rei_mdwdb.d_lov LKP
on COALESCE( CONCAT('CATEGORY','~','INCIDENT','~','~','~',upper(b.category )),'UNSPECIFIED')= LKP.row_id -- and LKP.source_id= b.sourceinstance
where COALESCE( LKP.row_key,case when b.category  is null then 0 else -1 end) <> a.category_src_key)c ;