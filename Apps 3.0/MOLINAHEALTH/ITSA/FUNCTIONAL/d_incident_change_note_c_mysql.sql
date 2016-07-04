SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM  
(select change_note_c,  u_change_note 
from  molinahealth_mdsdb.u_major_incident_final
join 
  molinahealth_mdwdb.d_incident on sys_id=row_id and sourceinstance=source_id)a
where u_change_note<>change_note_c;