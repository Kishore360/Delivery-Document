SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_time_card.time_entered' ELSE 'SUCCESS' END as Message
FROM (select * from  #MDS_TABLE_SCHEMA.hp_knta_users_final where cdctype<>'D') SRC
left join (select * from  #MDS_TABLE_SCHEMA.hp_tm_time_sheets_final) SRC1
 on SRC.user_id=SRC1.resource_id
 and SRC.sourceinstance=SRC1.sourceinstance
left join (select * from  #MDS_TABLE_SCHEMA.hp_tm_time_sheet_lines_final) SRC2
 on SRC1.time_sheet_id=SRC2.time_sheet_id
 and SRC.sourceinstance=SRC2.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.hp_knta_users_final)SRC9
on SRC1.resource_id=SRC9.user_id
left join(select * from #MDS_TABLE_SCHEMA.hp_ktmg_periods_final)SRC10
on SRC1.period_id=SRC10.period_id
left join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC11
on SRC2.work_item_set_id=SRC11.prj_project_id
left join(select * from #MDS_TABLE_SCHEMA.hp_rsc_resources_final)SRC12
on SRC1.resource_id=SRC12.resource_id
 inner join(select SRC3.time_sheet_line_id,SRC4.effort_order,SRC3.sourceinstance,sum(SRC4.effort_cost_bse) as effort_cost_bse,
 sum(SRC4.actual_effort) as total_eff, concat(SRC3.time_sheet_line_id,'~',SRC4.effort_order) as row_id from
 (select * from  #MDS_TABLE_SCHEMA.hp_tm_actuals_final where TOTALS_FLAG='Y')SRC3
 left join (select * from  #MDS_TABLE_SCHEMA.hp_tm_actuals_effort_final)SRC4
 on SRC3.actuals_id=SRC4.actuals_id group by SRC3.time_sheet_line_id, SRC3.sourceinstance,SRC4.effort_order,row_id
 and SRC3.sourceinstance=SRC4.sourceinstance)SRC6
 on SRC2.time_sheet_line_id=SRC6.time_sheet_line_id
 and SRC.sourceinstance=SRC6.sourceinstance
left join(select * from  #DWH_TABLE_SCHEMA.f_time_card)TRGT
on CONCAT(SRC6.time_sheet_line_id,'~',COALESCE(SRC6.effort_order,''))=COALESCE(TRGT.row_id,'') 
and COALESCE(SRC.sourceinstance,'')=COALESCE(TRGT.source_id,'')
WHERE COALESCE(SRC6.total_eff,'')<>round(COALESCE(TRGT.time_entered,''),5) 

