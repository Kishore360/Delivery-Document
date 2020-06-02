select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.change_impact_flag' ELSE 'SUCCESS' END as Message
from
(select change_request_key,case when sum(
incidents_caused_within_application+
incidents_caused_outside_application+
problems_caused_within_application+
problems_caused_outside_application+
problems_caused_by_change+
outages_caused_within_application+
outages_caused_outside_application) >0 then 1 else 0 end as impacted_changes
from #DWH_TABLE_SCHEMA.d_change_failure 
where current_flag='Y' and soft_deleted_flag='N'
group by 1)SRC
left join (select * from #DWH_TABLE_SCHEMA.d_change_failure where current_flag='Y' and soft_deleted_flag='N') TRGT
on SRC.change_request_key=TRGT.change_request_key
where (case when SRC.impacted_changes=1 then 'Y' else 'N' end) <>TRGT.change_impact_flag;