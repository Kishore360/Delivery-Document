SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sla_analysis_c.sla_type' ELSE 'SUCCESS' END as Message
from 
(
select count(1) cnt from 
mcd_mdsdb.task_final a 
join mcd_mdsdb.incident_final b
on a.sys_id = b.sys_id and a.sourceinstance = b.sourceinstance
left join mcd_mdsdb.task_sla_final c
on a.sys_id = c.task and c.stage <> 'cancelled'
join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1
 on (f1.source_id = c.sourceinstance)  and  (c.cdctime<=f1.lastupdated)
left join mcd_mdsdb.contract_sla_final d
on c.sla = d.sys_id
join  mcd_mdwdb.d_sla_analysis_c e 
on CONCAT(a.sys_id,'~',COALESCE(c.sla,'UNSPECIFIED'),'~',COALESCE(c.sys_id,'UNSPECIFIED'))=e.row_id and a.sourceinstance=e.source_id
where COALESCE(b.priority,'UNSPECIFIED')<> e.priority_src_code)a