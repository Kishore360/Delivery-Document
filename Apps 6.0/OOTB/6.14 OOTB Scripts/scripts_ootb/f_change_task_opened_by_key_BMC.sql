SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.opened_by_key' ELSE 'SUCCESS' END as Message
from (SELECT * FROM #MDS_TABLE_SCHEMA.hlx_tms_task_final WHERE RootRequestFormName='CHG:Infrastructure Change') SRC
left join #MDS_TABLE_SCHEMA.hlx_ctm_people_final submitter_lkp 
on SRC.submitter = submitter_lkp.remedy_login_id 
and SRC.sourceinstance = submitter_lkp.sourceinstance
left join (SELECT * FROM  #DWH_TABLE_SCHEMA.f_change_task where soft_deleted_flag='N') TRGT 
ON (SRC.Task_ID=TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id)
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
on ( concat('INTERNAL_CONTACT~',submitter_lkp.person_id) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN submitter_lkp.person_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.opened_by_key ,'')