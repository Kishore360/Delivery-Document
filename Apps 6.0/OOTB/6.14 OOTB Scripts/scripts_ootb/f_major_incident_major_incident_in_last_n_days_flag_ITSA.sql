SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident.major_incident_in_last_n_days_flag' ELSE 'major_incident_in_last_n_days_flag-SUCCESS' END as Message
 from 
(
select 
c_apl.sys_id,
d_apl.row_key as application_key,
mjr_inc_ct,mjr_inc_dt,
case when mjr_inc_ct>0 then 'Y' else 'N' end as major_incident_in_last_n_days_flag

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
where LKP.dimension_wh_code='CRITICAL' and inc.cdctype<>'D'
and coalesce(CONVERT_TZ(reopened_time,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#') , CONVERT_TZ(sys_created_on,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#')) between (lastupdated-Interval 7 day) and lastupdated
group by 1,2
)inc
on 
coalesce(inc.cmdb_ci, 0)=coalesce(c_apl.sys_id,0)
where c_apl.cdctype<>'D'
)SRC

left join #DWH_TABLE_SCHEMA.f_major_incident trgt
on SRC.sys_id=trgt.row_id
where SRC.major_incident_in_last_n_days_flag<>trgt.major_incident_in_last_n_days_flag;