SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_label.work_item_key' ELSE 'SUCCESS' END as Message
FROM
(select * from #MDS_TABLE_SCHEMA.issue_labels_final where cdctype<>'D') SRC 
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_work_item_label ) TRGT
ON CONCAT(SRC.issueid,'~',SRC.label) =TRGT.row_id  
and   SRC.sourceinstance =TRGT.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item lkp
ON concat(SRC.issueid,'') = lkp.row_id  and   SRC.sourceinstance =lkp.source_id
where  COALESCE(lkp.row_key,case when SRC.issueid is null then 0 else -1 end,0) <> COALESCE(TRGT.work_item_key,0)