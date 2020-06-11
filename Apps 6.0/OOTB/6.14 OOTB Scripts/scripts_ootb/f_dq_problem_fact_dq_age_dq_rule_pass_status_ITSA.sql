 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_dq_problem_fact_dq_age.dq_rule_pass_status' ELSE 'SUCCESS' END as Message
-- select distinct row_id_der, row_id,dq_target_value, target_column_value,dq_rule_pass_status,rule_pass_status  FROM  (select * from #DWH_TABLE_SCHEMA.f_dq_problem_fact  where target_column='dq_age' and soft_deleted_flag='N')dq_fact  left join
 from 
(
select distinct concat('dq_age','~',prob.row_key)  as row_id_der ,rule,rule_type,'dq_age' as dq_target_column, prob.row_key as target_key
, null as dq_target_value, case when Dq_issue=0 then 1.0000000000
when Dq_issue>0 then 0.0000000000
 end as dq_rule_pass_status -- , dq_fct.row_id, dq_fct.row_key
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
left join #STG_TABLE_SCHEMA.dq_issue_prob dq_issue
on dq_issue.target_key=prob.row_key
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o
 
 where  /*(cal1.lagging_count_of_month between 0 and 12) */ cast(prob.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 and prob.dimension_wh_code in ('CLOSED','OPEN')
) SRC
 left join (select * from #DWH_TABLE_SCHEMA.f_dq_problem_fact  where target_column='dq_age' and soft_deleted_flag='N')dq_fact
on row_id_der=dq_fact.row_id
-- where dq_fact.rule_pass_status is  null and SRC.dq_rule_pass_status is not  null 
-- where dq_fact.rule_pass_status is not null and SRC.dq_rule_pass_status is   null 
 where coalesce(dq_rule_pass_status, 'a')<>coalesce(rule_pass_status,'a')
 
 