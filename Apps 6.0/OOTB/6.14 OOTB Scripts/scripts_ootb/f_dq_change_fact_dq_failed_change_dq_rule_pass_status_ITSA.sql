 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_dq_change_fact_dq_failed_change.dq_rule_pass_status' ELSE 'SUCCESS' END as Message
-- select distinct row_id_der, row_id,dq_target_value, target_column_value,dq_rule_pass_status,rule_pass_status -- FROM   (select * from #DWH_TABLE_SCHEMA.f_dq_change_fact  where target_column='dq_failed_change' and soft_deleted_flag='N')dq_fact  left join
 from 
(
select distinct concat('dq_failed_change','~',ch_req.row_key) as row_id_der /*,rule,rule_type*/,'dq_failed_change' as dq_target_column, ch_req.row_key,
numerify_change_failure_flag as dq_target_value, case when Dq_issue=0 then 1.0000000000
when Dq_issue>0 then 0.0000000000
 end as dq_rule_pass_status-- , dq_fct.row_id, dq_fct.row_key
from (select * from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim where row_key not in ('-1','0') and module='change'  and soft_deleted_flag='N' and  active_flag<>'N' ) Conf_dim
 left join #DWH_TABLE_SCHEMA.d_dq_rules_dim d_dq_rules
 on d_dq_rules.row_key=Conf_dim.rule_key
cross join (Select d_chg.change_request_number,d_chg.row_key,d_chg.row_id,dimension_wh_code,opened_on,d_chg.changed_on, numerify_change_failure_flag from (Select * from #DWH_TABLE_SCHEMA.d_change_request where row_key not in ('-1','0')) d_chg
left join (SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D')f_chg
on f_chg.sys_id=d_chg.row_id
left join (select * from #DWH_TABLE_SCHEMA.d_change_failure  where soft_deleted_flag='N' and current_flag='Y')dcf
on d_chg.row_key=dcf.change_request_key
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
ON ( concat('STATE','~','CHANGE_REQUEST','~',upper(state))) = LKP.src_rowid 
left join #DWH_TABLE_SCHEMA.d_lov_map
on LKP.row_key=d_lov_map.src_key
 )ch_req
left join #DWH_TABLE_SCHEMA.d_calendar_date cal
on cast(d_dq_rules.dw_inserted_on as date)=cal.calendar_date
left join #STG_TABLE_SCHEMA.dq_issue 
on dq_issue.target_key=ch_req.row_key
cross join (SELECT MAX(lastupdated) AS lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness WHERE source_id=2 group by source_id)  d_o

 where d_dq_rules.rule='State=CLOSED' and ch_req.dimension_wh_code in ('CLOSED', 'RESOLVED')  and /*(cal1.lagging_count_of_month between 0 and 12) */ cast(ch_req.changed_on as date)>=ADDDATE(CAST(lastupdated AS DATE), INTERVAL -13 MONTH)
 ) SRC
 left join (select * from #DWH_TABLE_SCHEMA.f_dq_change_fact  where target_column='dq_failed_change' and soft_deleted_flag='N')dq_fact
on row_id_der=dq_fact.row_id
-- where dq_fact.rule_pass_status is  null and SRC.dq_rule_pass_status is not  null 
-- where dq_fact.rule_pass_status is not null and SRC.dq_rule_pass_status is   null 
 where coalesce(dq_rule_pass_status, 'a')<>coalesce(rule_pass_status,'a')
