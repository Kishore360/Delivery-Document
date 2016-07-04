SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM  
(select power_outage_c_flag,case when u_power_outage=1 then 'Y' else 'N' end as power_outage_c_flag_src  
from  molinahealth_mdsdb.u_major_incident_final
join 
 molinahealth_mdwdb.d_incident on sys_id=row_id and sourceinstance=source_id)a
where power_outage_c_flag_src<>power_outage_c_flag
