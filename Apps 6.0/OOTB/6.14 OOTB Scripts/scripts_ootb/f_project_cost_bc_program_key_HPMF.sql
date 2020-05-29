SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_task.changed_by' ELSE 'SUCCESS' END as Message
FROM (select *  from   #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final where cdctype<>'D')SRC
inner join(select * from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D')SRC1
on SRC.prj_project_id=SRC1.project_id
and SRC.sourceinstance=SRC1.sourceinstance
left join(select FINANCIAL_SUMMARY_ID,FISCAL_PERIOD_ID,LABOR_TYPE_CODE,EXPENSE_TYPE_CODE,sourceinstance,
SUM(AMOUNT_BSE) AMOUNT_BSE
from  #MDS_TABLE_SCHEMA.hp_fm_approved_budgets_final
group by financial_summary_id,fiscal_period_id)SRC2
on SRC.prj_financial_summary_id=SRC2.financial_summary_id
and SRC.sourceinstance=SRC2.sourceinstance
inner join(select * from  #MDS_TABLE_SCHEMA.hp_ppm_fiscal_periods_nls_final)SRC3
on SRC2.FISCAL_PERIOD_ID=SRC3.FISCAL_PERIOD_ID
and SRC1.sourceinstance=SRC3.sourceinstance
inner join
(
select E.project_id,F.project_req_id,F.lifecycle_id,G.content_id,G.program_id,min(F.creation_date)
from (select * from  #MDS_TABLE_SCHEMA.hp_pm_projects_final) E
inner join(select * from  #MDS_TABLE_SCHEMA.hp_pfm_lifecycle_parent_entity_final where active_entity='PROJECT')F
on E.pfm_request_id=F.project_req_id
and E.SOURCEINSTANCE=F.SOURCEINSTANCE
left join(select * from  #MDS_TABLE_SCHEMA.hp_pgm_program_content_final)G
on F.lifecycle_id=G.content_id
and F.sourceinstance=G.sourceinstance
group by E.project_id,F.project_req_id,F.lifecycle_id,G.content_id)program
on program.project_id=SRC.prj_project_id
left join (select * from    #DWH_TABLE_SCHEMA.f_project_cost)TRGT
on TRGT.row_id=concat(SRC.PRJ_PROJECT_ID,'~',SRC.PRJ_FINANCIAL_SUMMARY_ID,'~',SRC3.fiscal_period_id,'~',COALESCE(SRC2.LABOR_TYPE_CODE,'UNSPECIFIED'),
'~',COALESCE(SRC2.EXPENSE_TYPE_CODE,'UNSPECIFIED'))
AND SRC.SOURCEINSTANCE=TRGT.SOURCE_ID
left join(select * from #DWH_TABLE_SCHEMA.d_program)LKP
on program.program_id=LKP.row_id
and SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN program.program_id IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.program_key,'')