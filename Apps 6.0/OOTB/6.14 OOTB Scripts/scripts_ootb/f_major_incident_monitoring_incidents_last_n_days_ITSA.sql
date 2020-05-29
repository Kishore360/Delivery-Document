SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident.monitoring_incidents_last_n_days' ELSE 'monitoring_incidents_last_n_days-SUCCESS' END as Message
 -- select SRC.sys_id,trgt.row_id,SRC.monitoring_incidents_last_n_days,trgt.monitoring_incidents_last_n_days
 from 
(
select 
c_apl.sys_id,
d_apl.row_key as application_key,
coalesce(mjr_inc_ct,0) as monitoring_incidents_last_n_days ,mjr_inc_dt

from #MDS_TABLE_SCHEMA.cmdb_ci_appl_final c_apl
left join #DWH_TABLE_SCHEMA.d_application d_apl
on coalesce(concat('APPLICATION~',c_apl.sys_id),'UNSPECIFIED')=d_apl.row_id
left join (
select cmdb_ci,sourceinstance, max(coalesce(CONVERT_TZ(reopened_time,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#') , CONVERT_TZ(sys_created_on,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#'))) as mjr_inc_dt,
count(inc.sys_id) as mjr_inc_ct
from  #MDS_TABLE_SCHEMA.incident_final inc
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( concat('priority','~','incident','~',(priority)) = LKP.src_rowid 
AND inc.sourceinstance = LKP.source_id )
left join (select source_id, max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness group by 1)d_o
on inc.sourceinstance=d_o.source_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP1 
 ON ( concat('contact_type','~','incident','~',(contact_type)) = LKP1.src_rowid 
AND inc.sourceinstance = LKP1.source_id )
where inc.cdctype<>'D' and LKP1.dimension_wh_code='AUTO-GENERATED'
and coalesce(CONVERT_TZ(reopened_time,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#') , CONVERT_TZ(sys_created_on,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#')) between (lastupdated-Interval 7 day) and lastupdated
group by 1,2
)inc
on 
coalesce(inc.cmdb_ci, 0)=coalesce(c_apl.sys_id,0)
where c_apl.cdctype<>'D'
)SRC

left join #DWH_TABLE_SCHEMA.f_major_incident trgt
on SRC.sys_id=trgt.row_id
where SRC.monitoring_incidents_last_n_days<>trgt.monitoring_incidents_last_n_days;