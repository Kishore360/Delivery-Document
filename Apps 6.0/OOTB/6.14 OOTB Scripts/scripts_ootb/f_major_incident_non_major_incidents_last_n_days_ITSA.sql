SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident.non_major_incidents_last_n_days' ELSE 'non_major_incidents_last_n_days-SUCCESS' END as Message
 from 
(
select 
c_apl.sys_id,
d_apl.row_key as application_key,
coalesce(min_inc_ct,0) as non_major_incidents_last_n_days
from #MDS_TABLE_SCHEMA.cmdb_ci_appl_final c_apl
left join #DWH_TABLE_SCHEMA.d_application d_apl
on coalesce(concat('APPLICATION~',c_apl.sys_id),'UNSPECIFIED')=d_apl.row_id
left join (
select cmdb_ci,sourceinstance, -- max(coalesce(cast(reopened_time as date) , cast(sys_created_on as date))) as min_inc_dt,
count(inc.sys_id) as min_inc_ct
from  #MDS_TABLE_SCHEMA.incident_final inc
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( concat('priority','~','incident','~',(priority)) = LKP.src_rowid 
AND inc.sourceinstance = LKP.source_id )
left join (select source_id, max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness group by 1)d_o
on inc.sourceinstance=d_o.source_id
where LKP.dimension_wh_code<>'CRITICAL' and inc.cdctype<>'D'
and coalesce(CONVERT_TZ(reopened_time,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#') , CONVERT_TZ(sys_created_on,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#')) between (lastupdated-Interval 7 day) and lastupdated
group by 1,2
)inc
on 
coalesce(inc.cmdb_ci, 0)=coalesce(c_apl.sys_id,0)

where c_apl.cdctype<>'D'
)SRC

left join #DWH_TABLE_SCHEMA.f_major_incident trgt
on SRC.sys_id=trgt.row_id
where SRC.non_major_incidents_last_n_days<>trgt.non_major_incidents_last_n_days;