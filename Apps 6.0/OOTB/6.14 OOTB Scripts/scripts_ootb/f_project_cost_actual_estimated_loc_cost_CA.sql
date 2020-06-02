SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_cost.estimated_loc_cost' ELSE 'SUCCESS' END as Message
 FROM (select * from #MDS_TABLE_SCHEMA.ppa_wip_final SRC where cdctype <> 'D' ) SRC
left join #MDS_TABLE_SCHEMA.ppa_wip_values_final SRC2
on SRC.TRANSNO = SRC2.TRANSNO 
and SRC.sourceinstance = SRC2.sourceinstance
left join #MDS_TABLE_SCHEMA.inv_investments_final SRC3
on SRC.INVESTMENT_ID = SRC3.ID 
and SRC.sourceinstance = SRC3.sourceinstance
left join #MDS_TABLE_SCHEMA.inv_projects_final SRC4
on SRC3.ID = SRC4.PRID 
and SRC3.sourceinstance = SRC4.sourceinstance
left join #DWH_TABLE_SCHEMA.f_project_cost TRGT
on TRGT.row_id = COALESCE(CONCAT('ACT~',COALESCE(SRC.TRANSNO,'UNSPECIFIED'),'~',COALESCE(SRC2.ID,'UNSPECIFIED'),'~',COALESCE(DATE_FORMAT(SRC.TRANSDATE,'%Y%m%d'),'UNSPECIFED')),'UNSPECIFIED')
and TRGT.source_id = SRC.sourceinstance
where UPPER(SRC2.CURRENCY_TYPE) = 'HOME' AND UPPER(SRC3.ODF_OBJECT_CODE)='PROJECT' AND SRC4.IS_TEMPLATE=0 AND SRC4.IS_PROGRAM=0
and COALESCE(TRGT.estimated_loc_cost,'') <>0

