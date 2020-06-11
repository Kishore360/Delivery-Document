select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'LINKED_TO_OTHER_CI_FLAG validation failed for d_outage' ELSE 'SUCCESS' END as Message
from #DWH_TABLE_SCHEMA.d_outage
where (LINKED_TO_OTHER_CI_FLAG, row_key) not in
(
select case when f.BUSINESS_SERVICE_KEY in (0, -1) and f.application_key in (0,-1)
then 'Y' else 'N' end LINKED_TO_OTHER_CI_FLAG,
d.row_key
from #DWH_TABLE_SCHEMA.d_outage d
left join #DWH_TABLE_SCHEMA.f_outage f
on d.row_key = f.outage_key)
and row_key not in (0, -1);