 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_dq_problem_fact.row_id' ELSE 'SUCCESS' END as Message
 FROM
 -- select distinct row_id_der, dq_fact.row_id,dq_fact.row_key, target_column,dq_target_column from -- (select * from #DWH_TABLE_SCHEMA.f_dq_problem_fact where soft_deleted_flag='N') dq_fact left join 
(
select distinct  
case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type,dq_target_column -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,d_prob.changed_on from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in (-1,0) and soft_deleted_flag='N' ) d_prob
cross join #DWH_TABLE_SCHEMA.d_o_data_freshness d_o
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
 where d_dq_rules.rule='State=NEW' and rule_type='Complex' and prob.dimension_wh_code='OPEN' 
 and cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 -- (cal1.lagging_count_of_month between 0 and 12)
 
 /*and (case when Conf_dim.run_on ='MDW' then f_cr.pivot_date 
when Conf_dim.run_on ='MDS' then prob.changed_on end)   >'2018-11-05 16:00:00'*/
 
 union all
 
 select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type,dq_target_column -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,d_prob.changed_on from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in (-1,0) and soft_deleted_flag='N' ) d_prob
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
 where d_dq_rules.rule='State=CLOSED' and rule_type='Complex' and prob.dimension_wh_code in ('CLOSED', 'RESOLVED') 
 
and cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)

union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type,dq_target_column-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,d_prob.changed_on from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in (-1,0) and soft_deleted_flag='N' ) d_prob
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
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Complex' and prob.dimension_wh_code='OPEN' 
 and cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der ,rule,rule_type,dq_target_column-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,d_prob.changed_on from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in (-1,0) and soft_deleted_flag='N' ) d_prob
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
 where d_dq_rules.rule='State=INPROGRESS' and rule_type='Individual' and prob.dimension_wh_code='OPEN'  
 and cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)

union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der,rule,rule_type,dq_target_column -- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,d_prob.changed_on from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in (-1,0) and soft_deleted_flag='N' ) d_prob
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
 where d_dq_rules.rule='State=NEW' and rule_type='Individual' and prob.dimension_wh_code='OPEN'  
 and cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 
 union all 

select case when Conf_dim.run_on ='MDW' then concat(Conf_dim.row_id,'~',prob.row_key) 
when Conf_dim.run_on ='MDS' then concat(Conf_dim.row_id,'~',prob.row_id) end  as row_id_der ,rule,rule_type,dq_target_column-- , dq_fct.row_id, dq_fct.row_key
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in (-1,0) and soft_deleted_flag='N' and active_flag<>'N' and module='problem' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,d_prob.changed_on from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in (-1,0) and soft_deleted_flag='N' ) d_prob
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
 where d_dq_rules.rule='State=CLOSED' and rule_type='Individual' and prob.dimension_wh_code in ('CLOSED', 'RESOLVED') 
 and cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 
 union all 

 select distinct concat('dq_age','~',prob.row_key) as row_id_der,rule,rule_type,'dq_age' as dq_target_column /*, prob.row_key,
null as dq_target_value-- , null as dq_rule_pass_status-- , dq_fct.row_id, dq_fct.row_key*/
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on,d_prob.age from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0')) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
)prob
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 where prob.dimension_wh_code in ('CLOSED','OPEN') and  cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 
 union all

select distinct concat('dq_backlog_problem','~',prob.row_key) as row_id_der,rule,rule_type,'dq_backlog_problem' as dq_target_column /*, prob.row_key,
backlog_flag as dq_target_value-- , null as dq_rule_pass_status-- , dq_fct.row_id, dq_fct.row_key*/
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, backlog_flag from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0')) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
)prob
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 where   prob.dimension_wh_code in ('CLOSED','OPEN')
 and cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 
 union all
 
 select distinct concat('dq_reassignment_problem','~',prob.row_key) as row_id_der,rule,rule_type,'dq_reassignment_problem' as dq_target_column /*, prob.row_key,
case when prob.reassignment_count>3 then 'Y' else 'N' end as dq_target_value-- , null as dq_rule_pass_status-- , dq_fct.row_id, dq_fct.row_key*/
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, d_prob.reassignment_count from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0')) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
)prob
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 where   prob.dimension_wh_code in ('CLOSED','OPEN')
 and cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 union all
 
 select distinct concat('dq_reopen_problem','~',prob.row_key) as row_id_der,rule,rule_type,'dq_reopen_problem' as dq_target_column/*, prob.row_key,
case when reopened_count_sum>0 then 'Y' else 'N'end as dq_target_value-- , null as dq_rule_pass_status-- , dq_fct.row_id, dq_fct.row_key*/
 from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on, sum(dci.reopened_count) as reopened_count_sum   from (Select * from #DWH_TABLE_SCHEMA.d_problem where row_key not in ('-1','0')) d_prob
left join (SELECT * FROM #MDS_TABLE_SCHEMA.problem_final WHERE CDCTYPE<>'D')f_prob
on f_prob.sys_id=d_prob.row_id
left join (select * from #DWH_TABLE_SCHEMA.f_problem  where soft_deleted_flag='N' )dcf
on d_prob.row_key=dcf.problem_key
left join (select * from #DWH_TABLE_SCHEMA.f_incident  where soft_deleted_flag='N' )dci
on dcf.problem_key=dci.problem_key
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','problem','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
group by d_prob.problem_number,d_prob.row_key,d_prob.row_id,dimension_wh_code,opened_on,d_prob.changed_on
)prob
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #DWH_TABLE_SCHEMA.d_calendar_date cal1
on cast(prob.changed_on as date)=cal1.calendar_date
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 where  prob.dimension_wh_code in ('CLOSED','OPEN')
 and cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 
)src
left join  (select * from #DWH_TABLE_SCHEMA.f_dq_problem_fact where soft_deleted_flag='N') dq_fact
on row_id_der=dq_fact.row_id
 -- where row_id_der is not null and dq_fact.row_id is null
-- where row_id_der is null and dq_fact.row_id is not null
 where coalesce(row_id_der, 0)<>coalesce(row_id,0)
