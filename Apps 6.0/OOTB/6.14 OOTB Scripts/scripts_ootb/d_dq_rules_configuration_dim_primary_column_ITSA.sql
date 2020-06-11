SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_dq_rules_configuration_dim.primary_column' ELSE 'primary_column-SUCCESS' END as Message
 from 
(select 
concat(RuleID,'~',attribute,'~',RunOn,'~',Module) as row_id
,attribute as dq_target_column
,WhereClauseJoin as where_clause_join
,SourceEntity as source_entity
,RuleID as rule_key
,SourceColumn as source_column
,DQTable as dq_target_table
,PrimaryEntity as primary_entity
,DateFilterColumn as date_filter_column
,RunOn as run_on
,PrimaryColumn as primary_column
,JOINCondition as join_condition
,DateFilterValue as date_filter_value
,WhereClauseValue as where_clause_value
,ORDINAL_POSITION as ordinal_position
,WhereClauseColumn as where_clause_column
,WhereClauseTable as where_clause_table
from #MDS_TABLE_SCHEMA.us_dq_rules_configuration_final where cdctype<>'D') SRC

left join #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim TGT
on SRC.row_id=TGT.row_id

where SRC.primary_column<>TGT.primary_column;