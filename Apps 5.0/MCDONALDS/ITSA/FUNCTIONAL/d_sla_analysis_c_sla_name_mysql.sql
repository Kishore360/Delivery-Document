SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE  'SUCCESS'  END as Result, 
CASE WHEN count(1)>0  THEN  'Data mismatch' ELSE  'SUCCESS'  END as Message 
from mcdonalds_mdsdb.task_final a
join mcdonalds_mdsdb.incident_final b 
ON a.sys_id = b.sys_id and a.sourceinstance = b.sourceinstance and  b.CDCTYPE<>'D'
LEFT JOIN mcdonalds_mdsdb.task_sla_final c 
ON a.sys_id = c.task AND a.sourceinstance = c.sourceinstance and  c.CDCTYPE<>'D'
LEFT JOIN mcdonalds_mdsdb.contract_sla_final d 
ON c.sla = d.sys_id AND c.sourceinstance = d.sourceinstance  and d.CDCTYPE<>'D'
join mcdonalds_mdwdb.d_sla_analysis_c e 
on CONCAT(a.sys_id, '~',COALESCE(c.sla,'UNSPECIFIED'),'~',COALESCE(c.sys_id,'UNSPECIFIED'))=e.row_id and d.sourceinstance=e.source_id
 join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1
 on (f1.source_id = c.sourceinstance) 
 and  (c.cdctime<=f1.lastupdated)
WHERE c.stage <> 'cancelled'   and a.CDCTYPE ='X'
and COALESCE(c.sla,'UNSPECIFIED')<>e.sla_name;