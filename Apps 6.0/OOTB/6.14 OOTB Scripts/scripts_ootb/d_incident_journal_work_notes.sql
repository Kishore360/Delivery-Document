select 
-- inc.sys_id,sj.value as work_notes
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident_journal.work_notes' ELSE 'SUCCESS' END as Message
 
 -- select TRGT.row_id,SRC.sys_id,coalesce(sj.value,'') as SRC,coalesce(TRGT.work_notes,'')
 from 
( SELECT * FROM #MDS_TABLE_SCHEMA.sys_journal_field_final WHERE CDCTYPE<>'D') SRC

join  ( SELECT * FROM #MDS_TABLE_SCHEMA.task_final WHERE CDCTYPE<>'D') tas
on SRC.element_id=tas.sys_id
and tas.sys_class_name='incident'
and SRC.element = 'work_notes'
join  ( SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D') inc
on inc.sys_id=tas.sys_id and inc.sourceinstance=tas.sourceinstance
/*
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_journal_field_final WHERE CDCTYPE<>'D') sj
on tas.sys_id = sj.element_id*/
	
left join  #DWH_TABLE_SCHEMA.d_incident_journal TRGT
on SRC.sys_id=TRGT.row_id -- need to check
AND SRC.sourceinstance=TRGT.source_id

where 
-- and SRC.sys_id='21ed16ba0f63d640daa4cfdce1050e54'
 coalesce(SRC.value,'')<>coalesce(TRGT.work_notes,'')