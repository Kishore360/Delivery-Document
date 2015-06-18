 
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
select a.sys_id,b.row_id,a.u_category,trim(replace(c.row_id,'OUTAGE_TYPE_C~INCIDENT~~~',''))
from uclahealth_mdwdb.f_incident b
inner join uclahealth_mdsdb.incident_final a
on a.sys_id= b.row_id 
 join (select row_id,row_key,dimension_code,dimension_name from uclahealth_mdwdb.d_lov 
where dimension_class  like 'OUTAGE_TYPE_C~INCIDENT%')c
on dimension_code=u_outage_type 
where u_outage_type<>trim(replace(c.row_id,'OUTAGE_TYPE_C~INCIDENT~~~','')))E)i;