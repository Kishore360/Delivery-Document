 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_dq_change_fact.row_id' ELSE 'SUCCESS' END as Message
 FROM 
-- select distinct row_id_der, dq_fact.row_id,dq_fact.row_key, target_column,dq_target_column from -- (select * from #DWH_TABLE_SCHEMA.f_dq_change_fact where soft_deleted_flag='N') dq_fact
 -- left join 
(
select distinct  
case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type,dq_target_column -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
cross join #DWH_TABLE_SCHEMA.d_o_data_freshness d_o
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
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and ch_req.dimension_wh_code='OPEN' and f_cr.changed_on>'2018-11-05 16:00:00' 
 
 /*and (case when Conf_dim.run_on ='MDW' then f_cr.pivot_date 
when Conf_dim.run_on ='MDS' then ch_req.opened_on end)   >'2018-11-05 16:00:00'*/
 
 union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type,dq_target_column -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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
 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and ch_req.dimension_wh_code='CLOSED' and f_cr.changed_on>'2018-11-05 16:00:00'  /*and  (case when Conf_dim.run_on ='MDW' then f_cr.pivot_date 
when Conf_dim.run_on ='MDS' then ch_req.opened_on end)   >'2018-11-05 16:00:00'*/

union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type,dq_target_column-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and ch_req.dimension_wh_code='CANCELED' and f_cr.changed_on>'2018-11-05 16:00:00' /*and  (case when Conf_dim.run_on ='MDW' then f_cr.pivot_date 
when Conf_dim.run_on ='MDS' then ch_req.opened_on end)   >'2018-11-05 16:00:00'*/
 
 union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der ,rule,rule_type,dq_target_column-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Individual' and ch_req.dimension_wh_code='CANCELED'  and f_cr.changed_on>'2018-11-05 16:00:00' /*and (case when Conf_dim.run_on ='MDW' then f_cr.pivot_date 
when Conf_dim.run_on ='MDS' then ch_req.opened_on end)   >'2018-11-05 16:00:00'*/

union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der,rule,rule_type,dq_target_column -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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
 where d_dq_rules.rule='State=NEW' and rule_type='Individual' and ch_req.dimension_wh_code='OPEN'  and f_cr.changed_on>'2018-11-05 16:00:00' /*and (case when Conf_dim.run_on ='MDW' then f_cr.pivot_date 
when Conf_dim.run_on ='MDS' then ch_req.opened_on end)   >'2018-11-05 16:00:00'*/
 
 union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',ch_req.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',ch_req.row_id) end  as row_id_der ,rule,rule_type,dq_target_column-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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
 where d_dq_rules.rule='State=CLOSED' and rule_type='Individual' and ch_req.dimension_wh_code='CLOSED' and f_cr.changed_on>'2018-11-05 16:00:00'  /*and (case when Conf_dim.run_on ='MDW' then f_cr.pivot_date 
when Conf_dim.run_on ='MDS' then ch_req.opened_on end)   >'2018-11-05 16:00:00'*/
 
 union all 

select concat('dq_age','~',ch_req.row_key)  as row_id_der ,rule,rule_type,'dq_age' as dq_target_column-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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
where f_cr.changed_on>'2018-11-05 16:00:00' 
-- where /*ch_req.dimension_wh_code='CLOSED' and */  (case when Conf_dim.run_on ='MDW' then f_cr.pivot_date 
-- when Conf_dim.run_on ='MDS' then ch_req.opened_on end)   >'2018-11-05 16:00:00'
 
 union all 

select concat('dq_failed_change','~',ch_req.row_key) as row_id_der,rule,rule_type,'dq_failed_change' as dq_target_column-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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
 where ch_req.dimension_wh_code='CLOSED' and f_cr.changed_on>'2018-11-05 16:00:00'  /*and (case when Conf_dim.run_on ='MDW' then f_cr.pivot_date 
when Conf_dim.run_on ='MDS' then ch_req.opened_on end)   >'2018-11-05 16:00:00'  */
 
 union all 

select concat('dq_change_impact','~',ch_req.row_key) as row_id_der ,rule,rule_type,'dq_change_impact' as dq_target_column-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in (-1,0) and soft_deleted_flag='N' ) d_chg
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
 where ch_req.dimension_wh_code='CLOSED' and f_cr.changed_on>'2018-11-05 16:00:00'  /*and (case when Conf_dim.run_on ='MDW' then f_cr.pivot_date 
when Conf_dim.run_on ='MDS' then ch_req.opened_on end)  >'2018-11-05 16:00:00' */
 
)src
left join  (select * from #DWH_TABLE_SCHEMA.f_dq_change_fact where soft_deleted_flag='N') dq_fact
on row_id_der=dq_fact.row_id
 -- where row_id_der is not null and dq_fact.row_id is null
-- where row_id_der is null and dq_fact.row_id is not null
 where row_id_der<>row_id
