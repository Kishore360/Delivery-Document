drop table if exists qa_612_int2_workdb.dq_issue_prob;

create table qa_612_int2_workdb.dq_issue_prob as 
(select row_key as target_key /* ,
case when SRC.dq_rule_pass_status<1.0000000000 then 'Y' 
when SRC.dq_rule_pass_status>=1.0000000000 then 'N'
end as dq_flag */
,sum(case when dq_rule_pass_status<1.0000000000 then 1
when dq_rule_pass_status>=1.0000000000 then 0
end) Dq_issue
 from  qa_612_int2_workdb.dq_target_value_prob
 group by 1
)
