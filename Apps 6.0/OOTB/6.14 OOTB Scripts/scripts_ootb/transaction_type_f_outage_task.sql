select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'TRANSACTION_TYPE validation failed for d_outage' ELSE 'SUCCESS' END as Message
from ( SELECT * FROM #MDS_TABLE_SCHEMA.task_outage_final WHERE CDCTYPE<>'D') SRC
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') LKP
on SRC.task = LKP.sys_id and SRC.sourceinstance = LKP.sourceinstance
left join #DWH_TABLE_SCHEMA.f_outage_task TRGT
on TRGT.row_id = SRC.sys_id and TRGT.source_id = SRC.sourceinstance
where TRGT.TRANSACTION_TYPE <> upper(LKP.sys_class_name)