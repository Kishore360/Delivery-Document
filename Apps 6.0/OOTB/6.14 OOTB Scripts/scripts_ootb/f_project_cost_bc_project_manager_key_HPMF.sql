SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_cost.row_id' ELSE 'SUCCESS' END as Message
FROM (select *  from    #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final where cdctype<>'D')SRC
inner join(select * from  #MDS_TABLE_SCHEMA.hp_pm_projects_final where cdctype<>'D')SRC1
on SRC.prj_project_id=SRC1.project_id
and SRC.sourceinstance=SRC1.sourceinstance
left join(select FINANCIAL_SUMMARY_ID,FISCAL_PERIOD_ID,LABOR_TYPE_CODE,EXPENSE_TYPE_CODE,
SUM(AMOUNT_BSE) AMOUNT_BSE
from   #MDS_TABLE_SCHEMA.hp_fm_approved_budgets_final
group by financial_summary_id,fiscal_period_id)SRC2
on SRC.prj_financial_summary_id=SRC2.financial_summary_id
inner join(select * from   #MDS_TABLE_SCHEMA.hp_ppm_fiscal_periods_nls_final)SRC3
on SRC2.FISCAL_PERIOD_ID=SRC3.FISCAL_PERIOD_ID
left join (select * from    #DWH_TABLE_SCHEMA.f_project_cost)TRGT
on TRGT.row_id=concat(SRC.PRJ_PROJECT_ID,'~',SRC.PRJ_FINANCIAL_SUMMARY_ID,'~',SRC3.fiscal_period_id,'~',COALESCE(SRC2.LABOR_TYPE_CODE,'UNSPECIFIED'),
'~',COALESCE(SRC2.EXPENSE_TYPE_CODE,'UNSPECIFIED'))
AND SRC.SOURCEINSTANCE=TRGT.SOURCE_ID
left join #DWH_TABLE_SCHEMA.d_internal_contact SRC3
on concat('INTERNAL_CONTACT~',substring(SRC.PRJ_PROJECT_MANAGER_USER_ID,1,6)) = SRC3.row_id
and SRC.sourceinstance=SRC3.source_id
WHERE COALESCE(SRC3.row_key,CASE WHEN SRC.PRJ_PROJECT_MANAGER_USER_ID IS NULL THEN 0 else '-1' end)
<> COALESCE(TRGT.PROJECT_MANAGER_KEY ,0);