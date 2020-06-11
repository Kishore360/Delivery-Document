SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_dq_rules_configuration_dim' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(concat(RuleID,'~',attribute,'~',RunOn)) count_src from #MDS_TABLE_SCHEMA.us_dq_rules_configuration_final where cdctype<>'D' ) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.d_dq_rules_configuration_dim TGT where TGT.row_key not in (0, -1, -2)  ) count_trgt
 
 where count_src.count_src <>count_trgt.count_trgt
 )SQ;