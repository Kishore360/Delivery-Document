drop table if exists #STG_TABLE_SCHEMA.dq_issue;

create table #STG_TABLE_SCHEMA.dq_issue as 
(select row_key as target_key /* ,
case when SRC.dq_rule_pass_status<1.0000000000 then 'Y' 
when SRC.dq_rule_pass_status>=1.0000000000 then 'N'
end as dq_flag */
,sum(case when dq_rule_pass_status<1.0000000000 then 1
when dq_rule_pass_status>=1.0000000000 then 0
end) Dq_issue
 from  #STG_TABLE_SCHEMA.dq_target_value
 group by 1
)
