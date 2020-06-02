 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_dq_change_fact.target_key' ELSE 'SUCCESS' END as Message
 FROM 
-- select distinct row_id_der, dq_fact.row_id,dq_fact.row_key, target_column,dq_target_column, src.target_key,dq_fact.target_key from  -- #DWH_TABLE_SCHEMA.f_dq_change_fact dq_fact
--  left join 
(
select distinct  
case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type,dq_target_column , ch_req.row_key as target_key -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='Change' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,d_chg.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
cross join #DWH_TABLE_SCHEMA.d_o_data_freshness d_o
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

 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN'  and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) 
 
 union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type,dq_target_column , ch_req.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='Change' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,d_chg.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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

 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and ch_req.dimension_wh_code in ('CLOSED', 'RESOLVED')  and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) 

union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type,dq_target_column , ch_req.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='Change' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,d_chg.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) 
 
 union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der ,rule,rule_type,dq_target_column , ch_req.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='Change' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,d_chg.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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

 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Individual' and ch_req.dimension_wh_code='OPEN'  and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) 

union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type,dq_target_column , ch_req.row_key as target_key -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='Change' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,d_chg.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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

 where d_dq_rules.rule='State=NEW' and rule_type='Individual' and ch_req.dimension_wh_code='OPEN'  and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) 
 
 union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der ,rule,rule_type,dq_target_column , ch_req.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='Change' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,d_chg.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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

 where d_dq_rules.rule='State=CLOSED' and rule_type='Individual' and ch_req.dimension_wh_code in ('CLOSED', 'RESOLVED')  and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) 
 
 union all 

select concat('dq_age','~',ch_req.row_key)  as row_id_der ,rule,rule_type,'dq_age' as dq_target_column , ch_req.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='Change' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,d_chg.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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

where ch_req.dimension_wh_code in ('CLOSED','OPEN') and  /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH) 
 
 union all 

select concat('dq_failed_change','~',ch_req.row_key) as row_id_der,rule,rule_type,'dq_failed_change' as dq_target_column , ch_req.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='Change' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,d_chg.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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

 where ch_req.dimension_wh_code in ('CLOSED', 'RESOLVED')  and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)   
 
 union all 

select concat('dq_change_impact','~',ch_req.row_key) as row_id_der ,rule,rule_type,'dq_change_impact' as dq_target_column , ch_req.row_key as target_key-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='Change' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,d_chg.changed_on,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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

 where ch_req.dimension_wh_code in ('CLOSED', 'RESOLVED')  and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)  
 
)src
left join  #DWH_TABLE_SCHEMA.f_dq_change_fact dq_fact
on row_id_der=dq_fact.row_id
-- where row_id_der is not null and dq_fact.row_id is null
 -- where src.target_key is null and dq_fact.target_key is not null
where src.target_key<>dq_fact.target_key
