SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident.upcoming_changes' ELSE 'upcoming_changes-SUCCESS' END as Message
 from 
(
select 
c_apl.sys_id,
d_apl.row_key as application_key,
upcoming_chg_cnt as upcoming_changes
from #MDS_TABLE_SCHEMA.cmdb_ci_appl_final c_apl
left join #DWH_TABLE_SCHEMA.d_application d_apl
on coalesce(concat('APPLICATION~',c_apl.sys_id),'UNSPECIFIED')=d_apl.row_id
left join (
select cmdb_ci,sourceinstance, -- max(coalesce(cast(reopened_time as date) , cast(sys_created_on as date))) as min_inc_dt,
count(chg.sys_id) as upcoming_chg_cnt
from  #MDS_TABLE_SCHEMA.change_request_final chg
left join (select * from #DWH_TABLE_SCHEMA.d_change_request  where soft_deleted_flag='N')dcr
on dcr.row_id=chg.sys_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( concat('state','~','change_request','~',(state)) = LKP.src_rowid 
AND chg.sourceinstance = LKP.source_id )
left join (select source_id, max(lastupdated) as lastupdated from  #DWH_TABLE_SCHEMA.d_o_data_freshness group by 1)d_o
on chg.sourceinstance=d_o.source_id
where LKP.dimension_wh_code='OPEN' and chg.cdctype<>'D'
and dcr.planned_start_on  between lastupdated and  (lastupdated+Interval 7 day)
group by 1,2
)chg
on 
coalesce(chg.cmdb_ci, 0)=coalesce(c_apl.sys_id,0)

where c_apl.cdctype<>'D'
)SRC

left join #DWH_TABLE_SCHEMA.f_major_incident trgt
on SRC.sys_id=trgt.row_id
where SRC.upcoming_changes<>trgt.upcoming_changes;