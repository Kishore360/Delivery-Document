SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
(
select count(1) as cnt 
from wow_mdwdb.d_incident a
INNER JOIN wow_mdsdb.u_incident_outage_final src 
ON a.row_id = src.sys_id
AND a.source_id = src.sourceinstance
inner join wow_mdsdb.u_resolution_subcategory_final b
on src.u_res_code=b.sys_id
left join wow_mdwdb.d_lov c
on c.dimension_class like '%RESOLUTION_CODE~INCIDENT_OUTAGE%'
and CONCAT('RESOLUTION_CODE~INCIDENT_OUTAGE~~~',b.sys_id)=c.src_rowid
where c.row_key<>a.resolution_code_c_key
)a;

