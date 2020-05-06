select 
CASE when CNT>0 then 'FAILURE' ELSE 'SUCCESS' END as Result,

CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.finish_to_start_duration_c' ELSE 'SUCCESS' END as Message

from

(select COUNT(1) AS CNT from   equifax_mdsdb.incident_final  SRC

left join equifax_mdwdb.f_incident TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id

where 
CASE WHEN SRC.u_actual_start is null then 0
when SRC.u_actual_finish is null then 0
WHEN TIMESTAMPDIFF(SECOND ,SRC.u_actual_start,SRC.u_actual_finish) < 0 THEN 0 ELSE 
TIMESTAMPDIFF(SECOND ,SRC.u_actual_start,SRC.u_actual_finish)  end 
<>TRGT.finish_to_start_duration_c and SRC.cdctype<>'D'

)TEMP 