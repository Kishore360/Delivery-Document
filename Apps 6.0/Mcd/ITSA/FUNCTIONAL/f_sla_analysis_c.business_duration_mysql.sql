 
SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sla_analysis_c.sla_type' ELSE 'SUCCESS' END as Message
from 
(
select count(1) cnt from 
(
select CONCAT(a.sys_id, '~',c.sla,'~',c.sys_id) sys_id,a.sourceinstance sourceinstance,business_duration from 
(select sys_id,sys_class_name,sourceinstance  from mcd_mdsdb.task_final 
 where  sys_class_name='INCIDENT' and CDCTYPE<>'D'  )a
   JOIN  (select task,sourceinstance,stage, COALESCE(sla,'UNSPECIFIED')sla,cdctime,COALESCE(sys_id,'UNSPECIFIED') sys_id,
CASE WHEN business_duration is null  THEN NULL   
     WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',business_duration) < 0 THEN NULL    
     WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',business_duration) > 214748364 THEN NULL     
     ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',business_duration) END business_duration   from 
   mcd_mdsdb.task_sla_final 
   where CDCTYPE<>'D' and stage <> 'cancelled')c 
  ON a.sys_id = c.task AND a.sourceinstance = c.sourceinstance 
   join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1
 on (f1.source_id = c.sourceinstance)  and  (c.cdctime<=f1.lastupdated)
 )a1
join (select source_id,row_id,business_duration from mcd_mdwdb.f_sla_analysis_c where soft_deleted_flag='N' )e 
on a1.sys_id=e.row_id and a1.sourceinstance=e.source_id   
and  a1.business_duration <> e.business_duration

) temp;
