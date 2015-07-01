
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
select  a.category_src_code,a.category_src_key,b.u_category,CONCAT('CATEGORY~INCIDENT~~~',b.u_category),c.row_key,c.dimension_name
from f_incident a
inner join uclahealth_mdsdb.incident_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
left join d_lov c
on c.dimension_class like '%CATEGORY~INCIDENT%'
and CONCAT('CATEGORY~INCIDENT~~~',b.u_category)=c.src_rowid
where c.row_key<>a.category_src_key

)E

)i;

