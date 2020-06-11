 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_dq_incident_fact.target_column' ELSE 'SUCCESS' END as Message
 FROM 
-- select distinct row_id_der, dq_fact.row_id,dq_fact.row_key, target_column,dq_target_column, src.target_key,dq_fact.target_key from  -- #DWH_TABLE_SCHEMA.f_dq_incident_fact dq_fact
--  left join 
(
select distinct  
case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type,dq_target_column , inc.row_key as target_key -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,d_inc.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (-1,0) and soft_deleted_flag='N' ) d_inc
cross join #DWH_TABLE_SCHEMA.d_o_data_freshness d_o
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and inc.dimension_wh_code='OPEN'  and (cal1.lagging_count_of_month between 0 and 12) 
 
 union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type,dq_target_column , inc.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,d_inc.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (-1,0) and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and inc.dimension_wh_code in ('CLOSED', 'RESOLVED')  and (cal1.lagging_count_of_month between 0 and 12) 

union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type,dq_target_column , inc.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,d_inc.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (-1,0) and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and (cal1.lagging_count_of_month between 0 and 12) 
 
 union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der ,rule,rule_type,dq_target_column , inc.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,d_inc.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (-1,0) and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Individual' and inc.dimension_wh_code='OPEN'  and (cal1.lagging_count_of_month between 0 and 12) 

union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type,dq_target_column , inc.row_key as target_key -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,d_inc.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (-1,0) and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 where d_dq_rules.rule='State=NEW' and rule_type='Individual' and inc.dimension_wh_code='OPEN'  and (cal1.lagging_count_of_month between 0 and 12) 
 
 union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der ,rule,rule_type,dq_target_column , inc.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,d_inc.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (-1,0) and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 where d_dq_rules.rule='State=CLOSED' and rule_type='Individual' and inc.dimension_wh_code in ('CLOSED', 'RESOLVED')  and (cal1.lagging_count_of_month between 0 and 12) 
 
 union all 

select concat('dq_age','~',inc.row_key)  as row_id_der ,rule,rule_type,'dq_age' as dq_target_column , inc.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,d_inc.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (-1,0) and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
where inc.dimension_wh_code in ('CLOSED','OPEN') and  (cal1.lagging_count_of_month between 0 and 12) 
 
 union all 

select concat('dq_backlog_incident','~',inc.row_key) as row_id_der,rule,rule_type,'dq_backlog_incident' as dq_target_column , inc.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,d_inc.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (-1,0) and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 where inc.dimension_wh_code in ('CLOSED','OPEN')  and (cal1.lagging_count_of_month between 0 and 12)   
 
 union all 

select concat('dq_reassignment_incident','~',inc.row_key) as row_id_der ,rule,rule_type,'dq_reassignment_incident' as dq_target_column , inc.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,d_inc.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (-1,0) and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 where inc.dimension_wh_code in ('CLOSED','OPEN')  and (cal1.lagging_count_of_month between 0 and 12)  
 
  union all 

select concat('dq_reopen_incident','~',inc.row_key) as row_id_der ,rule,rule_type,'dq_reopen_incident' as dq_target_column , inc.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,d_inc.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in (-1,0) and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 where inc.dimension_wh_code in ('CLOSED','OPEN')  and (cal1.lagging_count_of_month between 0 and 12)  
)src
left join  #DWH_TABLE_SCHEMA.f_dq_incident_fact dq_fact
on row_id_der=dq_fact.row_id
-- where row_id_der is not null and dq_fact.row_id is null
 -- where src.target_key is null and dq_fact.target_key is not null
where coalesce(src.dq_target_column,'')<>coalesce(dq_fact.target_column,'')
