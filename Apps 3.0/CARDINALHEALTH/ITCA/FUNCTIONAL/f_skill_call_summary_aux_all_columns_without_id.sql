

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_acd.row_id' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_workdb.fs_skill_call_summary_aux SRC 
LEFT JOIN cardinalhealth_mdwdb.f_skill_call_summary_aux TRGT 
	ON (SRC.row_id =TRGT.row_id and SRC.source_id = TRGT.source_id )
WHERE COALESCE(concat(SRC.parent_row_id,SRC.row_id,SRC.aux_time,SRC.created_by,SRC.created_on,SRC.changed_by,SRC.changed_on,SRC.cdctype,SRC.pivot_date,SRC.source_id,SRC.soft_deleted_flag,SRC.parent_row_key),'')
<> 
      COALESCE(concat(TRGT.parent_row_id,TRGT.row_id,TRGT.aux_time,TRGT.created_by,SRC.created_on,TRGT.changed_by,TRGT.changed_on,TRGT.cdctype,TRGT.pivot_date,TRGT.source_id,TRGT.soft_deleted_flag,SRC.parent_row_key),'')
	  
	  
