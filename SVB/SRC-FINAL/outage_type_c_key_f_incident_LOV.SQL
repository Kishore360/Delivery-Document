
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
select  b.u_outage_type_,CONCAT('OUTAGE_TYPE~INCIDENT~~~',b.u_outage_type_),c.row_key,c.dimension_name

from uclahealth_mdwdb.f_incident a
inner join uclahealth_mdsdb.incident_final b

on a.row_id=b.sys_id
and a.source_id=b.sourceinstance

left join uclahealth_mdwdb.d_lov c
on c.dimension_class like '%OUTAGE_TYPE_C~INCIDENT%'
and CONCAT('OUTAGE_TYPE~INCIDENT~~~',b.u_outage_type_)=c.src_rowid
where c.row_key<>a.outage_type_c_key

)E

)i;

