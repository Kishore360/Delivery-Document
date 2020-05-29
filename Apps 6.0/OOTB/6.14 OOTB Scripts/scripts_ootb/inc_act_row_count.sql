select case when count(1) > 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 0 then 'MDS to DWH row_count failed for f_incident_activity' else 'SUCCESS' end as Message
from 
(select * from
(select count(*) count_1 from #DWH_TABLE_SCHEMA.f_incident_activity TGT) A, 
(select count(*)*3 count_2 from #DWH_TABLE_SCHEMA.f_incident F) B, 
(select count(*) count_3 from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_audit_final WHERE CDCTYPE<>'D') SRC where SRC.tablename = 'incident') C
where count_1 <> (count_2+count_3)) SQ;