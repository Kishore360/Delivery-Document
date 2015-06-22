
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
select a.sys_id,b.row_id,CONCAT('CATEGORY~INCIDENT~~~',a.u_category) 
from uclahealth_mdwdb.f_incident b
inner join uclahealth_mdsdb.incident_final a
on a.sys_id= b.row_id 
 left outer join (select row_id,row_key,dimension_code,dimension_name from uclahealth_mdwdb.d_lov 
where dimension_class  like 'CATEGORY~INCIDENT%')c
on dimension_code=u_category 
where CONCAT('CATEGORY~INCIDENT~~~',u_category)<> c.row_id)E

)i;