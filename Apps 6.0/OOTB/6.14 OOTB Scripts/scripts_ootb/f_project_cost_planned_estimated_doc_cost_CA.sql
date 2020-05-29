SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_cost.estimated_doc_cost' ELSE 'SUCCESS' END as Message
 FROM (select * from #MDS_TABLE_SCHEMA.fin_plans_final  SRC where cdctype <> 'D' ) SRC 
left join #MDS_TABLE_SCHEMA.fin_cost_plan_details_final SRC2
on SRC.ID = SRC2.PLAN_ID 
and SRC.sourceinstance = SRC2.sourceinstance
inner join #MDS_TABLE_SCHEMA.odf_ssl_cst_dtl_cost_final SRC3
on SRC3.PRJ_OBJECT_ID = SRC2.ID 
and SRC3.sourceinstance = SRC2.sourceinstance
left join #MDS_TABLE_SCHEMA.inv_investments_final SRC4
on SRC4.ID = SRC.OBJECT_ID
and SRC4.sourceinstance = SRC.sourceinstance
left join #MDS_TABLE_SCHEMA.inv_projects_final SRC5 
on SRC5.PRID = SRC4.ID
and SRC5.sourceinstance = SRC4.sourceinstance
left join #DWH_TABLE_SCHEMA.f_project_cost TRGT
on COALESCE(CONCAT('PLAN~',SRC.ID,'~',COALESCE(SRC2.ID,'UNSPECIFIED'),'~',COALESCE(DATE_FORMAT(SRC3.START_DATE,'%Y%m%d'),'UNSPECIFIED')),'UNSPECIFIED')
= TRGT.row_id
and SRC.sourceinstance = TRGT.source_id
where UPPER(SRC.PLAN_TYPE_CODE)='FORECAST' AND UPPER(SRC.OBJECT_CODE) = 'PROJECT' AND UPPER(SRC4.ODF_OBJECT_CODE)='PROJECT' AND SRC5.IS_PROGRAM=0 AND SRC5.IS_TEMPLATE=0	
and ROUND(COALESCE(DATEDIFF(SRC3.FINISH_DATE,SRC3.START_DATE)*SRC3.SLICE,0),7)
<> ROUND(COALESCE(TRGT.estimated_doc_cost,''),7);