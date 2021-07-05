SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sla_analysis_c.sla_type' ELSE 'SUCCESS' END as Message
from 
(
select count(1) cnt from 
(
select CONCAT(a.sys_id, '~',c.sla,'~',c.sys_id) sys_id,a.sourceinstance sourceinstance,a.priority priority,l.row_key row_key from 
(select sys_id,sys_class_name,sourceinstance,priority,COALESCE(CONCAT('PRIORITY~INCIDENT~~~',UPPER(priority)),'UNSPECIFIED') priority1  from mcd_mdsdb.task_final 
 where  sys_class_name='INCIDENT' and CDCTYPE<>'D'  )a
   JOIN  (select task,sourceinstance,stage,COALESCE(sla,'UNSPECIFIED')sla,cdctime,COALESCE(sys_id,'UNSPECIFIED') sys_id from 
   mcd_mdsdb.task_sla_final 
   where CDCTYPE<>'D' and stage <> 'cancelled')c 
  ON a.sys_id = c.task AND a.sourceinstance = c.sourceinstance 
  left join (select row_key,row_id,source_id from mcd_mdwdb.d_lov )l on a.priority1=l.row_id and a.sourceinstance=l.source_id
join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1
 on (f1.source_id = c.sourceinstance)  and  (c.cdctime<=f1.lastupdated)
 )a1
join (select source_id,row_id,priority_src_key from mcd_mdwdb.d_sla_analysis_c where soft_deleted_flag='N' )e 
on a1.sys_id=e.row_id and a1.sourceinstance=e.source_id   
and COALESCE(a1.row_key,case when a1.priority is NULL then 0 else -1 end)<>e.priority_src_key

) temp;
  