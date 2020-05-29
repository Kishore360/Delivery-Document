select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'caused_by_change_key validation failed for f_outage' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') SRC
left join #DWH_TABLE_SCHEMA.f_outage TRGT
on TRGT.ROW_ID = SRC.sys_id
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') inc
on inc.sys_id = SRC.task_number 
and inc.sourceinstance=SRC.sourceinstance
left join #DWH_TABLE_SCHEMA.d_change_request d_chng
on inc.caused_by = d_chng.row_id
where TRGT.row_key not in (0, -1)
and case when inc.caused_by is not null and d_chng.row_key is not null then d_chng.row_key
when inc.caused_by is not null and d_chng.row_key is null then -1 
else 0 end  <> TRGT.caused_by_change_key ;