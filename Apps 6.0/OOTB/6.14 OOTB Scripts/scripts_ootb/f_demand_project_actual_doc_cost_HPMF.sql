SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM    #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype <> 'D') SRC 
 inner join(select * from   #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN   #DWH_TABLE_SCHEMA.f_demand TRGT 
ON (SRC.request_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
left join(select *   from   #DWH_TABLE_SCHEMA.f_project)LKP
on TRGT.project_key=LKP.project_key
and TRGT.source_id=LKP.source_id
WHERE COALESCE(LKP.total_actual_doc_cost,CASE WHEN LKP.project_key IS NULL THEN 0 else '-1' end)<> 
COALESCE(TRGT.project_actual_doc_cost,0)
