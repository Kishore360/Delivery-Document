select 
CASE when CNT>0 then 'FAILURE' ELSE 'SUCCESS' END as Result,

CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.finish_to_start_duration_c' ELSE 'SUCCESS' END as Message

from

(select COUNT(1) AS CNT from   equifax_mdsdb.incident_final  SRC

left join equifax_mdwdb.f_incident TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id

where 
CASE WHEN ((coalesce(SRC.u_actual_start,SRC.opened_at,SRC.sys_created_on)) is null) OR 
(coalesce(SRC.u_actual_finish,SRC.resolved_at) is null) THEN NULL   
WHEN TIMESTAMPDIFF(SECOND,coalesce(SRC.u_actual_start,SRC.opened_at,SRC.sys_created_on),coalesce(SRC.u_actual_finish,SRC.resolved_at)) < 0 THEN NULL    
ELSE TIMESTAMPDIFF(SECOND,coalesce(SRC.u_actual_start,SRC.opened_at,SRC.sys_created_on),coalesce(SRC.u_actual_finish,SRC.resolved_at)) end <>TRGT.finish_to_start_duration_c

)TEMP;
