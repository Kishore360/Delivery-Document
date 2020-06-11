SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Outage_Duration validation failed for f_outage' ELSE 'SUCCESS' END as Message
from
( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') SRC
left join 
 #DWH_TABLE_SCHEMA.f_outage TRGT
 on SRC.sys_id=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
where   timestampdiff(SECOND,'1970-01-01 00:00:00',coalesce(SRC.duration,'1970-01-01 00:00:00'))
<>coalesce(TRGT.outage_duration,'');