 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_dq_change_fact.rule_pass_status' ELSE 'SUCCESS' END as Message
  from
 -- select distinct row_id_der, row_id,dq_target_value, target_column_value,dq_rule_pass_status,rule_pass_status  FROM --  (select * from  #DWH_TABLE_SCHEMA.f_dq_change_fact  where soft_deleted_flag='N')dq_fact left join
 
(
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
ch_req.row_key, dio.organization_name as dq_target_value ,
cast(case when (dio.organization_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio.organization_name is null)  then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_organization dio
 on dio.row_key=f_cr.assignment_group_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW'
 and rule_type='Complex'
 and ch_req.dimension_wh_code='OPEN'
and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 and dq_target_column='Assignment Group'
 
union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column, 
 ch_req.row_key, case when ch_req.planned_start_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value 
 ,cast(case when (ch_req.planned_start_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN')  or f_cr.planned_start_on_key is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on, planned_start_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change Planned Start Date'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, dic.full_name as dq_target_value
,cast(case when (dic.full_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dic.full_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_contact dic
 on f_cr.assigned_to_key=dic.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Assignee'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_ser.criticality as dq_target_value
 ,cast(case when( d_ser.criticality in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_ser.criticality is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 left join  #DWH_TABLE_SCHEMA.d_service d_ser
 on f_cr.business_service_key=d_ser.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Business Criticality'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_lov_impact.dimension_name as dq_target_value
 ,cast(case when (d_lov_impact.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_impact.dimension_name is null)then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='IMPACT~CHANGE_REQUEST') d_lov_impact
 on f_cr.impact_src_key=d_lov_impact.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change Impact'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_lov_priority.dimension_name as dq_target_value
 ,cast(case when (d_lov_priority.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_priority.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
  left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='PRIORITY~CHANGE_REQUEST') d_lov_priority
 on f_cr.priority_src_key=d_lov_priority.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change priority'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_lov_type.dimension_name as dq_target_value
 ,cast(case when (d_lov_type.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_type.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
  left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='TYPE~CHANGE_REQUEST') d_lov_type
 on f_cr.type_src_key=d_lov_type.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change Type'
 
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_lov_urgency.dimension_name as dq_target_value
 ,cast(case when (d_lov_urgency.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_urgency.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
  left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='URGENCY~CHANGE_REQUEST') d_lov_urgency
   on f_cr.urgency_src_key=d_lov_urgency.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change Urgency'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_conf_itm.name as dq_target_value
 ,cast(case when (d_conf_itm.name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_conf_itm.name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
  left join #DWH_TABLE_SCHEMA.d_configuration_item d_conf_itm
 on f_cr.configuration_item_key=d_conf_itm.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change CI'
 
  union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_ci.class as dq_target_value
 ,cast(case when (d_ci.class in(null,'','UNSPECIFIED','UNALLOCATED','UNDEFINED','UNKONWN','UNKNOWN','-1','0') or d_ci.class is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 left join #DWH_TABLE_SCHEMA.d_configuration_item d_ci
 on f_cr.configuration_item_key=d_ci.row_key

left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change CI Class'
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_loc.location_name as dq_target_value-- f_cr.configuration_item_key,d_ci.row_key
 ,cast(case when (d_loc.location_name in(null,'','UNSPECIFIED','UNALLOCATED','UNDEFINED','UNKONWN','UNKNOWN','-1','0') or d_loc.location_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 left join #DWH_TABLE_SCHEMA.d_configuration_item d_ci
 on f_cr.configuration_item_key=d_ci.row_key
 left join #DWH_TABLE_SCHEMA.d_location d_loc
 on d_loc.row_key=d_ci.location_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change CI Location'	

union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, coalesce(d_lov_category.dimension_name, 'UNSPECIFIED') as dq_target_value
 ,cast(case when (d_lov_category.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_category.dimension_name is null)then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='CATEGORY~CHANGE_REQUEST') d_lov_category
on f_cr.category_src_key=d_lov_category.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change Category'	 
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, coalesce(d_lov_review_status.dimension_name, 'UNSPECIFIED') as dq_target_value
 ,cast(case when (d_lov_review_status.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_review_status.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='REVIEW_STATUS~CHANGE_REQUEST') d_lov_review_status
on f_cr.review_status_src_key=d_lov_review_status.row_key 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change Review Status'	

 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_lov_risk.dimension_name as dq_target_value
  ,cast(case when (d_lov_risk.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_risk.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='RISK~CHANGE_REQUEST') d_lov_risk
on f_cr.risk_src_key=d_lov_risk.row_key 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change Risk'	  
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, dio1.organization_name as dq_target_value
  ,cast(case when (dio1.organization_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or dio1.organization_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization dio1
on dio1.row_key=f_cr.requested_by_department_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Department'

union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, coalesce(d_lov_reason.dimension_name,'UNSPECIFIED') as dq_target_value
  ,cast(case when (d_lov_reason.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_reason.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='REASON~CHANGE_REQUEST') d_lov_reason
 on f_cr.reason_src_key=d_lov_reason.row_key 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Reason' 
 
 union all
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_loc.location_name as dq_target_value
  ,cast(case when (d_loc.location_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_loc.location_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
  left join #DWH_TABLE_SCHEMA.d_location d_loc
 on f_cr.location_key=d_loc.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Change Location' 
 
  union all
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, case when ch_req.planned_end_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value
   ,cast(case when (ch_req.planned_end_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or ch_req.planned_end_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on,planned_end_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Planned End Date' 

 union all
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, case when expected_start_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value
  ,cast(case when (ch_req.expected_start_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or ch_req.expected_start_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on,expected_start_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Expected Start Date'  
 
 union all
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_lov_approval_state.dimension_name as dq_target_value
   ,cast(case when (d_lov_approval_state.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_approval_state.dimension_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='APPROVAL~CHANGE_REQUEST') d_lov_approval_state
 on f_cr.approval_state_src_key=d_lov_approval_state.row_key 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Approval'  
 
 union all 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, d_incon.full_name as dq_target_value
   ,cast(case when (d_incon.full_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_incon.full_name is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_contact d_incon
 on f_cr.assigned_to_key=d_incon.row_key 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Assigned To'  
 
  union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, case when ch_req.work_start_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value
   ,cast(case when (ch_req.work_start_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or ch_req.work_start_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on,work_start_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Actual Start Date'  
 
union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, case when ch_req.approval_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value
  ,cast(case when (ch_req.approval_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or ch_req.approval_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on,approval_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Approval Date'  
 
 
 
 union all
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, case when ch_req.closed_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value
  ,cast(case when (ch_req.closed_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or ch_req.closed_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on,closed_on  from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and ch_req.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Closed Date'  
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, case when ch_req.work_end_on is not null then 'DQ-NO' else 'DQ-YES' end as dq_target_value
  ,cast(case when (ch_req.work_end_on in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or ch_req.work_end_on is null) then 0 else 1 end as decimal(28,10)) as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on, work_end_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and ch_req.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Actual End Date' 
 
  union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, coalesce(d_lov_close_cd.dimension_name, 'UNSPECIFIED') as dq_target_value
  ,cast(case when (d_lov_close_cd.dimension_name in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or d_lov_close_cd.dimension_name is null) then 0 else 1 end as decimal(28,10))as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on, close_code_src_key from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
  left join (select * from #DWH_TABLE_SCHEMA.d_lov where dimension_class='CLOSE_CODE~CHANGE_REQUEST')d_lov_close_cd
 on ch_req.close_code_src_key=d_lov_close_cd.row_key
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and ch_req.dimension_wh_code in ('CLOSED', 'RESOLVED') and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Close Code' 


 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key,-- ch_req.justification as dq_target_value
case when (ch_req.justification is null or   ( (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)<=10)) then '0 - 10 words'
when (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)>10 then '11 - 20 words'
when (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)>20 then '21 - 30 words'
when (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)>30 then '31 - 50 words'
when (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)>50 then 'Above 50 words'
end  as dq_target_value
 ,cast(case when (ch_req.justification in(null,'','UNSPECIFIED','UNALLOCATED','UNDEFINED','UNKONWN','UNKNOWN','-1','0') or ch_req.justification is null)  then 0
 when (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)<=10 then 0
when (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)>10 then 0.2
when (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)>20 then 0.4
when (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)>30 then 0.6
when (LENGTH(ch_req.justification) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.justification,'\n',''), ' ', ''), ' ', ''))+1)>50 then 1
 
end as decimal(28,10))as dq_rule_pass_status
-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on, f_chg.justification from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Individual' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Justification' 
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, -- ch_req.Short_Description as dq_target_value,
ch_req.Short_Description as dq_target_value,
 cast(case when (ch_req.Short_Description in('-1','0','null','UNSPECIFIED','UNALLOCATED',' ','UNDEFINED','UNKONWN','UNKNOWN') or ch_req.Short_Description is null) then 0 else 1 end as decimal(28,10))as dq_rule_pass_status

-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on, d_chg.Short_Description from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N' ) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
 left join #DWH_TABLE_SCHEMA.f_change_request f_cr
 on f_cr.change_request_key=ch_req.row_key
 
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='Short Description' 
 
 union all
select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type, dq_target_column,
 ch_req.row_key, -- ch_req.close_notes as dq_target_value
case when (ch_req.close_notes is null or   ( (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=10)) then '0 - 10 words'
when (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>10 then '11 - 20 words'
when (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>20 then '21 - 30 words'
when (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>30 then '31 - 50 words'
when (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>50 then 'Above 50 words'
end  as dq_target_value
 ,cast(case when (ch_req.close_notes in(null,'','UNSPECIFIED','UNALLOCATED','UNDEFINED','UNKONWN','UNKNOWN','-1','0') or ch_req.close_notes is null)  then 0
 when (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=10 then 0
when (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=20 and (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>10 then 0.2
when (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=30 and (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>20 then 0.4
when (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)<=50 and (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>30 then 0.6
when (LENGTH(ch_req.close_notes) - LENGTH(REPLACE(REPLACE(REPLACE(ch_req.close_notes,'\n',''), ' ', ''), ' ', ''))+1)>50 then 1
 
end as decimal(28,10))as dq_rule_pass_status
 -- , dq_fct.row_id, dq_fct.row_key
  from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N') Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on, f_chg.close_notes from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0') and soft_deleted_flag='N') d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(ch_req.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=CLOSED' and rule_type='Individual' and ch_req.dimension_wh_code in ('CLOSED', 'RESOLVED')  and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) and dq_target_column='close notes'
 )SRC
left join (select * from  #DWH_TABLE_SCHEMA.f_dq_change_fact  where soft_deleted_flag='N')dq_fact
on row_id_der=dq_fact.row_id
where coalesce(dq_rule_pass_status, 'a')<>coalesce(rule_pass_status,'a')
