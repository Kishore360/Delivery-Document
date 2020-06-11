select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'NO_MESSAGE_FLAG validation failed for d_outage' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.d_outage TRGT
on TRGT.ROW_id = SRC.sys_id
where TRGT.NO_MESSAGE_FLAG <> case when SRC.message is null then 'Y' else 'N' end
and TRGT.row_key not in (0,-1);