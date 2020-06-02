drop table if exists #STG_TABLE_SCHEMA.dq_target_value_prob;
 create table #STG_TABLE_SCHEMA.dq_target_value_prob as  select * from 
 (
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, d_lov_urgency.dimension_name as dq_target_value
 ,cast(case when (d_lov_urgency.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_urgency.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
  left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='URGENCY~problem') d_lov_urgency
   on f_cr.urgency_src_key=d_lov_urgency.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Urgency'
 
 
 
  union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, d_lov_priority.dimension_name as dq_target_value
 ,cast(case when (d_lov_priority.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_priority.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
  left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='PRIORITY~problem') d_lov_priority
 on f_cr.priority_src_key=d_lov_priority.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='priority'
 
 union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, d_conf_itm.name as dq_target_value
 ,cast(case when (d_conf_itm.name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_conf_itm.name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
  left join #DWH_TABLE_SCHEMA.d_configuration_item d_conf_itm
 on f_cr.configuration_item_key=d_conf_itm.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Affected CI'
 
union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, d_lov_impact.dimension_name as dq_target_value
 ,cast(case when (d_lov_impact.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_impact.dimension_name is null)then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
 left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='IMPACT~problem') d_lov_impact
 on f_cr.impact_src_key=d_lov_impact.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date

cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Impact'
 
  union all
 select distinct case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, coalesce(d_loc.location_name,'UNSPECIFIED') as dq_target_value
  ,cast(case when (d_loc.location_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_loc.location_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
  left join #DWH_TABLE_SCHEMA.d_location d_loc
 on f_cr.location_key=d_loc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Location' 
 
 union all
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, prob.short_description as dq_target_value
  ,cast(case when (prob.short_description in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or prob.short_description is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, f_prob.short_description  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Short description' 
 
union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
prob.row_key, dio.full_name as dq_target_value ,
cast(case when (dio.full_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio.full_name is null)  then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_contact dio
 on dio.row_key=f_cr.opened_by_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date

cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW'
 and rule_type='Complex'
 and prob.dimension_wh_code='OPEN'
and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 and dq_target_column='Opened By'
  
  union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
prob.row_key, dio.organization_name as dq_target_value ,
cast(case when (dio.organization_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio.organization_name is null)  then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_organization dio
 on dio.row_key=f_cr.opened_by_department_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW'
 and rule_type='Complex'
 and prob.dimension_wh_code='OPEN'
and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 and dq_target_column='Department'
  
  
   union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, -- prob.Description as dq_target_value,
case when (prob.Description is null or   ( (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)<=10)) then '0 - 10 words'
when (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)>10 then '11 - 20 words'
when (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)>20 then '21 - 30 words'
when (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)>30 then '31 - 50 words'
when (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)>50 then 'Above 50 words'
end  as dq_target_value
 ,cast(case when (prob.Description in(null,'','UNSPECIFIED','UNALLOCATED','UNDEFINED','UNKONWN','UNKNOWN','-1','0') or prob.Description is null)  then 0
 when (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)<=10 then 0
when (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)>10 then 0.2
when (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)>20 then 0.4
when (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)>30 then 0.6
when (LENGTH(prob.Description) - LENGTH(REPLACE(REPLACE(REPLACE(prob.Description,'\n',''), ' ', ''), ' ', ''))+1)>50 then 1
 
end as decimal(28,10))as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, d_prob.Description from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Individual' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Description' 
 
union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
 prob.row_key, case when prob.opened_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value 
 ,cast(case when (prob.opened_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN')  or prob.opened_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Opened On'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
 prob.row_key, case when prob.due_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value 
 ,cast(case when (prob.due_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN')  or prob.due_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, due_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Due date'

 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
 prob.row_key, prob.active_flag as dq_target_value 
 ,cast(case when (prob.active_flag in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN')  or prob.active_flag is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on,d_prob.active_flag  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Active'


union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
 prob.row_key, prob.sys_domain as dq_target_value 
 ,cast(case when (prob.sys_domain  in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN')  or prob.sys_domain is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, f_prob.sys_domain  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Domain'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
 prob.row_key, prob.related_incidents as dq_target_value 
 ,cast(case when (prob.related_incidents<=0  or prob.related_incidents is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, f_prob.related_incidents  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Related incidents'
 
 union all 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
prob.row_key, dio.organization_name as dq_target_value ,
cast(case when (dio.organization_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio.organization_name is null)  then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_organization dio
 on dio.row_key=f_cr.assignment_group_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1

on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=INPROGRESS'
 and rule_type='Complex'
 and prob.dimension_wh_code='OPEN'
and/*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 and dq_target_column='Assignment Group'
 
  union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, dic.full_name as dq_target_value
,cast(case when (dic.full_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dic.full_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_contact dic
 on f_cr.assigned_to_key=dic.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Assigned To'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, case when (prob.sla_due in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or prob.sla_due is null) then 'DQ-YES' else 'DQ-NO' end as dq_target_value
,cast(case when (prob.sla_due in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or prob.sla_due is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on ,f_prob.sla_due from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='SLA Due'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, prob.met_sla_flag as dq_target_value
,cast(case when (prob.met_sla_flag in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or prob.met_sla_flag is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on ,d_prob.met_sla_flag from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Made SLA'
 
union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
 prob.row_key, case when prob.due_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value 
 ,cast(case when (prob.due_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN')  or prob.due_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, due_on  from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Due date'

  union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, prob.major_problem as dq_target_value
,cast(case when (prob.major_problem =0 or prob.major_problem is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on ,f_prob.major_problem from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Major Problem'
 
     union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, prob.known_error_flag as dq_target_value
,cast(case when (prob.known_error_flag is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on ,d_prob.known_error_flag from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Know Error'
 
   union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, -- prob.Description as dq_target_value,
case when (prob.work_notes is null or   ( (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=10)) then '0 - 10 words'
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>10 then '11 - 20 words'
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>20 then '21 - 30 words'
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>30 then '31 - 50 words'
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>50 then 'Above 50 words'
end  as dq_target_value
 ,cast(case when (prob.work_notes in(null,'','UNSPECIFIED','UNALLOCATED','UNDEFINED','UNKONWN','UNKNOWN','-1','0') or prob.work_notes is null)  then 0
 when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=10 then 0
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>10 then 0.2
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>20 then 0.4
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>30 then 0.6
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>50 then 1
 
end as decimal(28,10))as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, f_prob.work_notes from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Individual' and prob.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Work Notes' 
 
 
     union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, dic.full_name as dq_target_value
,cast(case when (dic.full_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dic.full_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on ,f_prob.known_error from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_contact dic
 on f_cr.closed_by_key=dic.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and prob.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Closed by'
 
     union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, case when prob.closed_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value
,cast(case when (prob.closed_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or prob.closed_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on ,d_prob.closed_on from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and prob.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Closed Date'
 
   union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, -- prob.Description as dq_target_value,
case when (prob.close_notes is null or   ( (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=10)) then '0 - 10 words'
when (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>10 then '11 - 20 words'
when (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>20 then '21 - 30 words'
when (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>30 then '31 - 50 words'
when (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>50 then 'Above 50 words'
end  as dq_target_value
 ,cast(case when (prob.close_notes in(null,'','UNSPECIFIED','UNALLOCATED','UNDEFINED','UNKONWN','UNKNOWN','-1','0') or prob.close_notes is null)  then 0
 when (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=10 then 0
when (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>10 then 0.2
when (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>20 then 0.4
when (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>30 then 0.6
when (LENGTH(prob.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>50 then 1
 
end as decimal(28,10))as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, d_prob.close_notes from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=CLOSED' and rule_type='Individual' and prob.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Close Notes' 
 
    union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 prob.row_key, -- prob.Description as dq_target_value,
case when (prob.work_notes is null or   ( (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=10)) then '0 - 10 words'
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>10 then '11 - 20 words'
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>20 then '21 - 30 words'
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>30 then '31 - 50 words'
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>50 then 'Above 50 words'
end  as dq_target_value
 ,cast(case when (prob.work_notes in(null,'','UNSPECIFIED','UNALLOCATED','UNDEFINED','UNKONWN','UNKNOWN','-1','0') or prob.work_notes is null)  then 0
 when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=10 then 0
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>10 then 0.2
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>20 then 0.4
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>30 then 0.6
when (LENGTH(prob.work_notes) - LENGTH(REPLACE(REPLACE(REPLACE(prob.work_notes,'\n',''), ' ', ''), ' ', ''))+1)>50 then 1
 
end as decimal(28,10))as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0')  and soft_deleted_flag='N' and  active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, f_prob.work_notes from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )prob
 left join #DWH_TABLE_SCHEMA.f_problem f_cr
 on f_cr.problem_key=prob.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where d_dq_rules.rule='State=CLOSED' and rule_type='Individual' and prob.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)and dq_target_column='Work Notes' 
)SRC
