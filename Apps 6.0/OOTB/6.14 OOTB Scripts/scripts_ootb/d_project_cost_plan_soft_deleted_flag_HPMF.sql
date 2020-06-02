SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_cost_plan.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final where cdctype<>'D') SRC
inner join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC1
on SRC.financial_summary_id= SRC1.prj_financial_summary_id
and SRC.sourceinstance=SRC1.sourceinstance
left join(select * from #DWH_TABLE_SCHEMA.d_project_cost_plan)TRGT
on SRC.financial_summary_id=TRGT.row_id
and COALESCE(SRC.sourceinstance,'')=COALESCE(TRGT.source_id,'')
WHERE COALESCE(CASE WHEN SRC.cdctype='D' THEN 'Y' ELSE 'N' END,'')<>COALESCE(TRGT.soft_deleted_flag,'') 
