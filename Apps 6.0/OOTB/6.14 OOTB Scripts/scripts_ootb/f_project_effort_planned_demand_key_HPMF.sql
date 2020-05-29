SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_project_efford.row_id' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final where cdctype<>'D')SRC
inner join(select concat(COALESCE(pfm_project.PRJ_PROJECT_ID,0),'~',date_format(COALESCE(convert_tz(position_forecast.forecast_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')),'%Y%m%d'))
as planned_row_id,PRJ_PROJECT_ID,sum(forecast_value) as forecast_value,position_forecast.forecast_date
from (select *  from   #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final where cdctype<>'D')pfm_project
left join(select * from #MDS_TABLE_SCHEMA.hp_rsc_position_forecast_final)position_forecast
on pfm_project.PRJ_STAFF_PROF_ID=position_forecast.STAFFING_PROFILE_ID
and pfm_project.sourceinstance=position_forecast.sourceinstance group by planned_row_id)planned_effort
on SRC.PRJ_PROJECT_ID=planned_effort.PRJ_PROJECT_ID
left join(select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC2
on SRC2.prop_project_id=SRC.PRJ_PROJECT_ID
and SRC2.sourceinstance=SRC.sourceinstance
left join(select * from #DWH_TABLE_SCHEMA.f_project_effort)TRGT
on CONCAT('PLANNED','~',SRC.PRJ_PROJECT_ID,'~',planned_effort.planned_row_id)=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_demand LKP
on LKP.row_id = SRC2.request_id 
and SRC.sourceinstance = LKP.source_id
WHERE  planned_effort.planned_row_id is not null
and COALESCE(LKP.row_key,case when SRC2.request_id is null then 0 else -1 end)<> COALESCE(TRGT.demand_key,0)
 







