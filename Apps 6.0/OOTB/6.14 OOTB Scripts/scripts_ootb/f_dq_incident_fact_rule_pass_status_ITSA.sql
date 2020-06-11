 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_dq_incident_fact.rule_pass_status' ELSE 'SUCCESS' END as Message
-- select distinct row_id_der, row_id,dq_target_value, target_column_value,dq_rule_pass_status,rule_pass_status -- FROM --  (select * from #DWH_TABLE_SCHEMA.f_dq_incident_fact  where target_column not like 'dq%') dq_fact left join
 from

 (
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
inc.row_key, coalesce(dio.dimension_name,'UNSPECIFIED') as dq_target_value ,
cast(case when (dio.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio.dimension_name is null)  then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 left join (select * from #DWH_TABLE_SCHEMA.d_lov where (dimension_class='CONTACT_TYPE~INCIDENT' or row_key in (0,-1))) dio
 on dio.row_key=f_cr.reported_type_src_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW'
 and rule_type='Complex'
 and inc.dimension_wh_code='OPEN'
and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)
 and dq_target_column='Contact Type'
 union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
inc.row_key, dio.full_name as dq_target_value ,
cast(case when (dio.full_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio.full_name is null)  then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, caller_key  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_contact dio
 on dio.row_key=inc.caller_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW'
 and rule_type='Complex'
 and inc.dimension_wh_code='OPEN'
and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)
 and dq_target_column='Caller'
 
 union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
inc.row_key, coalesce(dio.dimension_name,'UNSPECIFIED') as dq_target_value ,
cast(case when (dio.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio.dimension_name is null)  then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 left join (select * from #DWH_TABLE_SCHEMA.d_lov where (dimension_class='CATEGORY~INCIDENT' or row_key in (0,-1))) dio
 on dio.row_key=f_cr.category_src_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW'
 and rule_type='Complex'
 and inc.dimension_wh_code='OPEN'
and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)
 and dq_target_column='CATEGORY'
 
  union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, d_lov_impact.dimension_name as dq_target_value
 ,cast(case when (d_lov_impact.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_impact.dimension_name is null)then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='IMPACT~incident') d_lov_impact
 on f_cr.impact_src_key=d_lov_impact.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Impact'


  union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
inc.row_key, coalesce(dio.dimension_name, 'UNSPECIFIED') as dq_target_value ,
cast(case when (dio.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio.dimension_name is null)  then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='SUBCATEGORY~INCIDENT') dio
 on dio.row_key=f_cr.sub_category_src_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW'
 and rule_type='Complex'
 and inc.dimension_wh_code='OPEN'

and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)
 and dq_target_column='SUB-CATEGORY'
 
 union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, d_lov_urgency.dimension_name as dq_target_value
 ,cast(case when (d_lov_urgency.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_urgency.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
  left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='URGENCY~incident') d_lov_urgency
   on f_cr.urgency_src_key=d_lov_urgency.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
 cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Urgency'
   union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, d_lov_priority.dimension_name as dq_target_value
 ,cast(case when (d_lov_priority.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_priority.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
  left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='PRIORITY~incident') d_lov_priority
 on f_cr.priority_src_key=d_lov_priority.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='priority'
 
 union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, d_conf_itm.name as dq_target_value
 ,cast(case when (d_conf_itm.name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_conf_itm.name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
  left join #DWH_TABLE_SCHEMA.d_configuration_item d_conf_itm
 on f_cr.configuration_item_key=d_conf_itm.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Affected CI'
 
  union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, -- inc.Short_Description as dq_target_value,
inc.Short_Description as dq_target_value,
 cast(case when (inc.Short_Description in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or inc.Short_Description is null) then 0 else 1 end as decimal(28,10))as dq_rule_pass_status

-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='incident'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, d_inc.Short_Description from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Short Description' 
 
  union all
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, d_loc.location_name as dq_target_value
  ,cast(case when (d_loc.location_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_loc.location_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='incident'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
  left join #DWH_TABLE_SCHEMA.d_location d_loc
 on f_cr.location_key=d_loc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Location' 
 
  
  
  
  
  
  
  union all
  
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, d_loc.location_name as dq_target_value
  ,cast(case when (d_loc.location_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_loc.location_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
  left join #DWH_TABLE_SCHEMA.d_location d_loc
 on f_cr.location_key=d_loc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='incident Location' 
 
 union all
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, inc.short_description as dq_target_value
  ,cast(case when (inc.short_description in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or inc.short_description is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, f_inc.short_description  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Short description' 
 
union all

 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
inc.row_key, dio.full_name as dq_target_value ,
cast(case when (dio.full_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio.full_name is null)  then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_contact dio
 on dio.row_key=f_cr.opened_by_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW'
 and rule_type='Complex'
 and inc.dimension_wh_code='OPEN'
and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)
 and dq_target_column='Opened By'
  
  union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
inc.row_key, dio.organization_name as dq_target_value ,
cast(case when (dio.organization_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio.organization_name is null)  then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_organization dio
 on dio.row_key=f_cr.opened_by_department_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW'
 and rule_type='Complex'
 and inc.dimension_wh_code='OPEN'
and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)
 and dq_target_column='Department'
  
  
   union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, -- inc.Description as dq_target_value,
case when (inc.Description is null or   ( (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)<=10)) then '0 - 10 words'
when (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)>10 then '11 - 20 words'
when (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)>20 then '21 - 30 words'
when (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)>30 then '31 - 50 words'
when (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)>50 then 'Above 50 words'
end  as dq_target_value
 ,cast(case when (inc.Description in(null,'','UNSPECIFIED','UNALLOCATED','UNDEFINED','UNKONWN','UNKNOWN','-1','0') or inc.Description is null)  then 0
 when (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)<=10 then 0
when (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)>10 then 0.2
when (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)>20 then 0.4
when (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)>30 then 0.6
when (LENGTH(inc.Description) - LENGTH(REPLACE(REPLACE(REPLACE(inc.Description,'\n',''), ' ', ''), ' ', ''))+1)>50 then 1
 
end as decimal(28,10))as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, d_inc.Description from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Individual' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Description' 
 
union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
 inc.row_key, case when inc.opened_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value 
 ,cast(case when (inc.opened_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN')  or inc.opened_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Opened On'
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
 inc.row_key, inc.sys_domain as dq_target_value 
 ,cast(case when (inc.sys_domain  in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN')  or inc.sys_domain is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, f_inc.sys_domain  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Domain'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
 inc.row_key, case when inc.opened_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value 
 ,cast(case when (inc.opened_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN')  or inc.opened_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Opened On'
 
  union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
 inc.row_key, case when inc.due_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value 
 ,cast(case when (inc.due_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN')  or inc.due_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, due_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Due date'
 
 union all 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
inc.row_key, dio.organization_name as dq_target_value ,
cast(case when (dio.organization_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio.organization_name is null)  then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_organization dio
 on dio.row_key=f_cr.assignment_group_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS'
 and rule_type='Complex'
 and inc.dimension_wh_code='OPEN'
and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)
 and dq_target_column='Assignment Group'
 
  union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, dic.full_name as dq_target_value
,cast(case when (dic.full_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dic.full_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_contact dic
 on f_cr.assigned_to_key=dic.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Assigned To'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, case when (inc.sla_due in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or inc.sla_due is null) then 'DQ-YES' else 'DQ-NO' end  as dq_target_value
,cast(case when (inc.sla_due in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or inc.sla_due is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on ,f_inc.sla_due from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='SLA Due'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, inc.met_sla_flag as dq_target_value
,cast(case when  (inc.met_sla_flag in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or inc.met_sla_flag is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on ,d_inc.met_sla_flag from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Made SLA'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, case when (inc.due_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or inc.due_on is null) then 'DQ-YES' else 'DQ-NO' end as dq_target_value
,cast(case when (inc.due_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or inc.due_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on ,d_inc.due_on from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Due date'
 
 union all
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, d_lov_severity.dimension_name as dq_target_value
 ,cast(case when (d_lov_severity.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_severity.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
  left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='SEVERITY~incident') d_lov_severity
   on f_cr.severity_src_key=d_lov_severity.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and inc.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Severity'
 
 union all

 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, case when inc.resolved_at is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value
 ,cast(case when (inc.resolved_at in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or inc.resolved_at is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, resolved_at  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and inc.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Resolved Date'
 
 union all

 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, case when inc.closed_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value
 ,cast(case when (inc.closed_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or inc.closed_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, d_inc.closed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and inc.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Closed Date'
 
 
 union all

 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, f_cr.close_code_src_code  as dq_target_value
 ,cast(case when (f_cr.close_code_src_code in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or f_cr.close_code_src_code is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, d_inc.closed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and inc.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Resolution Code'
 
    union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, -- inc.Description as dq_target_value,
case when (inc.close_notes is null or   ( (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=10)) then '0 - 10 words'
when (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>10 then '11 - 20 words'
when (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>20 then '21 - 30 words'
when (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>30 then '31 - 50 words'
when (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>50 then 'Above 50 words'
end  as dq_target_value
 ,cast(case when (inc.close_notes in(null,'','UNSPECIFIED','UNALLOCATED','UNDEFINED','UNKONWN','UNKNOWN','-1','0') or inc.close_notes is null)  then 0
 when (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=10 then 0
when (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>10 then 0.2
when (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>20 then 0.4
when (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>30 then 0.6
when (LENGTH(inc.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(inc.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>50 then 1
 
end as decimal(28,10))as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, f_inc.close_notes from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=CLOSED' and rule_type='Individual' and inc.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Resolution Notes' 
 
 union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',inc.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',inc.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 inc.row_key, dic.full_name as dq_target_value
,cast(case when (dic.full_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dic.full_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='incident' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )inc
 left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=inc.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_contact dic
 on f_cr.closed_by_key=dic.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date
  cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and inc.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ inc.changed_on>=ADDDATE(lastupdated , INTERVAL -13 MONTH)and dq_target_column='Closed by'
/*
 union all
 
 select distinct concat('dq_age_incident','~',inc.row_key) as row_id_der,rule,rule_type,'dq_age_incident' as dq_target_column, inc.row_key,
age as dq_target_value, null as dq_rule_pass_status-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on,d_inc.age from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0')) d_inc
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

 where  (cal1.lagging_count_of_month between 0 and 12) 
 
 union all

select distinct concat('dq_backlog_incident','~',inc.row_key) as row_id_der,rule,rule_type,'dq_backlog_incident' as dq_target_column, inc.row_key,
backlog_flag as dq_target_value, null as dq_rule_pass_status-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, backlog_flag from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0')) d_inc
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

 where  (cal1.lagging_count_of_month between 0 and 12) 
 
 union all
 
 select distinct concat('dq_reassignment_incident','~',inc.row_key) as row_id_der,rule,rule_type,'dq_reassignment_incident' as dq_target_column, inc.row_key,
inc.reassignment_count as dq_target_value, null as dq_rule_pass_status-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, d_inc.reassignment_count from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0')) d_inc
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

 where  (cal1.lagging_count_of_month between 0 and 12) 
 
 union all
 
 select distinct concat('dq_Reopen_incident','~',inc.row_key) as row_id_der,rule,rule_type,'dq_Reopen_incident' as dq_target_column, inc.row_key,
reopened_count_sum as dq_target_value, null as dq_rule_pass_status-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on, sum(dcf.reopened_count) as reopened_count_sum   from (Select * from #DWH_TABLE_SCHEMA.d_incident where row_key not in ('-1','0')) d_inc
left join (SELECT * FROM #MDS_TABLE_SCHEMA.incident_final WHERE CDCTYPE<>'D')f_inc
on f_inc.sys_id=d_inc.row_id
left join (select * from #DWH_TABLE_SCHEMA.f_incident  where soft_deleted_flag='N' )dcf
on d_inc.row_key=dcf.incident_key
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','incident','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
group by d_inc.incident_number,d_inc.row_key,d_inc.row_id,dimension_wh_code,opened_on,d_inc.changed_on
 )inc
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(inc.changed_on as date)=cal1.calendar_date

 where  (cal1.lagging_count_of_month between 0 and 12) */
)SRC
 left join (select * from #DWH_TABLE_SCHEMA.f_dq_incident_fact  where target_column not like 'dq%' and soft_deleted_flag='N') dq_fact
on row_id_der=dq_fact.row_id
-- where dq_fact.rule_pass_status is  null and SRC.dq_rule_pass_status is not  null 
-- where dq_fact.rule_pass_status is not null and SRC.dq_rule_pass_status is   null 
-- where coalesce(dq_target_value, 'a')<>coalesce(target_column_value,'a')
where coalesce(dq_rule_pass_status, 'a')<>coalesce(rule_pass_status,'a')






 