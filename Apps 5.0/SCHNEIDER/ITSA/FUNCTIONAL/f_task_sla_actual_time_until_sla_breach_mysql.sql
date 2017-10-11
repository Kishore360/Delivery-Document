
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task_sla.actual_time_until_sla_breach' ELSE 'SUCCESS' END as Message 
from schneider_mdsdb.slm_measurement_final src 
join schneider_mdwdb.f_task_sla stg on stg.row_id= src.instanceid and stg.source_id=src.sourceinstance where
CASE                  WHEN src.metmissedamount  is null  THEN NULL                    WHEN src.metmissedamount < 0 THEN NULL                  when src.metmissedamount  > 214748364 THEN NULL                   ELSE src.metmissedamount end  <> 
stg.actual_time_until_sla_breach

