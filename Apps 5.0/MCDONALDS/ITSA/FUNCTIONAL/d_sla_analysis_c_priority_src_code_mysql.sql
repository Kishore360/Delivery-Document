SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sla_analysis_c.sla_type' ELSE 'SUCCESS' END as Message
from 
(
select count(1) cnt from 
mcdonalds_mdsdb.task_final a 
join mcdonalds_mdsdb.incident_final b
on a.sys_id = b.sys_id and a.sourceinstance = b.sourceinstance
left join mcdonalds_mdsdb.task_sla_final c
on a.sys_id = c.task and c.stage <> 'cancelled'
left join mcdonalds_mdsdb.contract_sla_final d
on c.sla = d.sys_id
join  mcdonalds_mdwdb.d_sla_analysis_c e 
on CONCAT(a.sys_id,'~',COALESCE(c.sla,'UNSPECIFIED'),'~',COALESCE(c.sys_id,'UNSPECIFIED'))=e.row_id and a.sourceinstance=e.source_id
where COALESCE(b.priority,'UNSPECIFIED')<> e.priority_src_code)a