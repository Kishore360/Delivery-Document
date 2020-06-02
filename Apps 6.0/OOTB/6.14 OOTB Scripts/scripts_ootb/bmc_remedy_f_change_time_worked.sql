SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (select cr.total_time_spent, timestampdiff(second,ea.earliest_prog,la.latest_prog) as expected_time_worked,
cr.infrastructure_change_id,
cr.sourceinstance
from #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_final cr
join (select sa.documentkey, sa.sourceinstance, min(sys_created_on) as earliest_prog
from #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final sa
where newvalue in ('Planning In Progress','Implementation In Progress')
group by sa.documentkey, sa.sourceinstance) ea
on (ea.documentkey=cr.infrastructure_change_id and ea.sourceinstance=cr.sourceinstance)

join (select sa.documentkey, sa.sourceinstance, max(sys_created_on) as latest_prog
from #MDS_TABLE_SCHEMA.bmc_chg_infrastructure_change_sys_audit_final sa
where oldvalue in ('Planning In Progress','Implementation In Progress')
group by sa.documentkey, sa.sourceinstance) la
on (la.documentkey=cr.infrastructure_change_id and la.sourceinstance=cr.sourceinstance)
) 
SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
ON (SRC.infrastructure_change_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE COALESCE(case when SRC.total_time_spent=0 then SRC.expected_time_worked else SRC.total_time_spent end,'') <> COALESCE(TRGT.time_worked,'')

