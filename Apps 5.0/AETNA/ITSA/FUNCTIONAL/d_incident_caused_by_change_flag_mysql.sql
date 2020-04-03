SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
from (select count(1) cnt from
(select cdctime,b.number, a.caused_by_change_flag , CASE WHEN b.caused_by is not null or b.u_temp_caused_by	 is not null THEN 'Y'  ELSE 'N' END abc  FROM  
aetna_mdwdb.d_incident a 
JOIN aetna_mdsdb.incident_final b
ON a.row_id = b.sys_id and a.source_id = b.sourceinstance -- and number='INC5486056'
left join (select source_id,max(lastupdated) as lastupdated from aetna_mdwdb.d_o_data_freshness group by source_id) f1 on
 (f1.source_id = b.sourceinstance)
where b.cdctype<>'D' and  (b.cdctime<=f1.lastupdated) )a where 
a.caused_by_change_flag <> abc)a