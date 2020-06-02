SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.primary_duration' ELSE 'SUCCESS' END as Message
from
(
SELECT TRGT.row_key,TRGT.row_id,TRGT.work_item_key ,TRGT_NXT.work_item_key1, TRGT.primary_sequence_id,TRGT_NXT.primary_sequence_id1,TRGT.created_on, TRGT_NXT.created_on1,dat.lastupdated,d.completed_on,
br.dimension_wh_code,TRGT.task_attribute_wh_new_value, TRGT.task_wh_type,TRGT.task_attribute_wh_name,TRGT.primary_duration,
CASE WHEN  TRGT_NXT.created_on1 IS NULL AND br.dimension_wh_code = 'COMPLETED' THEN timestampdiff( SECOND ,convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(d.completed_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') )
     WHEN  TRGT_NXT.created_on1 IS NULL AND br.dimension_wh_code != 'COMPLETED' THEN timestampdiff( SECOND ,convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(dat.lastupdated,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') )
     ELSE  timestampdiff( SECOND ,convert_tz(TRGT.created_on,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>'),convert_tz(TRGT_NXT.created_on1,'<<DW_TARGET_TIME_ZONE>>','<<TENANT_SSI_TIME_ZONE>>') ) 
 END AS primary_duration1
 FROM 
 (
 SELECT SRC.issueid, SRC.id, SRC2.issuechangelogid, SRC2.field, SRC.created, SRC.sourceinstance
 FROM apps_jira_dev_mdsdb.issue_changelog_final SRC
 left join apps_jira_dev_mdsdb.issue_changelog_items_final SRC2
 on SRC.id = SRC2.issuechangelogid and SRC.sourceinstance=SRC2.sourceinstance
 WHERE SRC2.field = 'status'
 ) main
 LEFT JOIN ( 
 SELECT * FROM apps_jira_dev_mdwdb.f_work_item_activity WHERE task_wh_type = 'work_item' and task_attribute_wh_name = 'status' and work_item_key in (1, 2, 19)) TRGT
 ON (concat(main.issueid, '~', main.issuechangelogid, '~', main.field) = TRGT.row_id 
 AND main.sourceinstance=TRGT.source_id)
 LEFT JOIN (
 SELECT TRGT_NXT.work_item_key as work_item_key1, TRGT_NXT.primary_sequence_id as primary_sequence_id1, TRGT_NXT.created_on as created_on1 FROM apps_jira_dev_mdwdb.f_work_item_activity TRGT_NXT 
 WHERE TRGT_NXT.task_wh_type = 'work_item' and TRGT_NXT.task_attribute_wh_name = 'status' and TRGT_NXT.work_item_key in (1, 2, 19)) TRGT_NXT
 ON TRGT.work_item_key = TRGT_NXT.work_item_key1 AND TRGT_NXT.primary_sequence_id1 = TRGT.primary_sequence_id + 1 AND TRGT.task_wh_type = 'work_item' and TRGT.task_attribute_wh_name = 'status' 
 INNER JOIN apps_jira_dev_mdwdb.d_work_item d ON TRGT.work_item_key = d.row_key and d.soft_deleted_flag = 'N'
 join apps_jira_dev_mdwdb.f_work_item F on F.work_item_key = d.row_key
 LEFT JOIN apps_jira_dev_mdwdb.d_lov_map br ON F.work_item_status_src_key = br.src_key AND br.dimension_class = 'STATUS~WORK_ITEM'
 JOIN (SELECT MAX(lastupdated) as lastupdated, source_id FROM apps_jira_dev_mdwdb.d_o_data_freshness group by source_id ) dat on TRGT.source_id = dat.source_id
 ) DRVD
 WHERE DRVD.task_attribute_wh_name = 'STATUS' and COALESCE(COALESCE(DRVD.primary_duration,''), '')<> COALESCE(DRVD.primary_duration1,'');