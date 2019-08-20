SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0  
THEN 'MDS to DWH data validation failed for d_incident.incident_investigation_start_c' ELSE 'SUCCESS' END as Message FROM (
select count(1)cnt  from
(select a.number,coalesce(b1.row_key,case when u_product_name is null then 0 else -1 end),b11.incident_product_name_c_key
from ntrs_mdsdb.incident_final a
left join ntrs_mdsdb.cmdb_ci_model_final b on u_product_name=b.sys_id and a.sourceinstance=b.sourceinstance
left join ntrs_mdwdb.d_cmdb_ci_model_c b1 on b1.row_id=b.sys_id and a.sourceinstance=b1.source_id
left join ntrs_mdwdb.f_incident b11 on b11.row_id=a.sys_id and a.sourceinstance=b11.source_id
left join ntrs_mdwdb.d_calendar_date d on opened_on_key=d.row_key
where  coalesce(b1.row_key,case when u_product_name is null then 0 else -1 end)<>b11.incident_product_name_c_key )a)v;