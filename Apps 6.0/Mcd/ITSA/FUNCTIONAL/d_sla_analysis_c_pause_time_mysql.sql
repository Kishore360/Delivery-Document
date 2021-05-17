SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sla_analysis_c.sla_type' ELSE 'SUCCESS' END as Message
from 
(
select count(1) cnt from 
(
select CONCAT(a.sys_id, '~',c.sla,'~',c.sys_id) sys_id,a.sourceinstance sourceinstance,pause_time from 
(select sys_id,sys_class_name,sourceinstance  from mcdonalds_mdsdb.task_final 
 where  sys_class_name='INCIDENT' and CDCTYPE<>'D'  )a
   JOIN  (select task,sourceinstance,stage,COALESCE(sla,'UNSPECIFIED')sla,cdctime,COALESCE(sys_id,'UNSPECIFIED') sys_id, CONVERT_TZ(pause_time,'GMT','US/Central') pause_time from 
   mcdonalds_mdsdb.task_sla_final 
   where CDCTYPE<>'D' and stage <> 'cancelled')c 
  ON a.sys_id = c.task AND a.sourceinstance = c.sourceinstance 
join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1
 on (f1.source_id = c.sourceinstance)  and  (c.cdctime<=f1.lastupdated)
 )a1
join (select source_id,row_id,pause_time from mcdonalds_mdwdb.d_sla_analysis_c where soft_deleted_flag='N' )e 
on a1.sys_id=e.row_id and a1.sourceinstance=e.source_id   
and  a1.pause_time <> e.pause_time

) temp;
