SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_dq_rules_dim.noise_words' ELSE 'noise_words-SUCCESS' END as Message
 from 
(select 
RuleDescription as rule_description
,NoiseWords as noise_words
,RuleID as row_id
,RuleEnteredOn as rule_inclusion_date
,RuleType as rule_type
,Weight as weight
,Rule as rule
,RuleCategory as rule_category
from #MDS_TABLE_SCHEMA.us_dq_rules_final where cdctype<>'D') SRC

left join #DWH_TABLE_SCHEMA.d_dq_rules_dim TGT
on SRC.row_id=TGT.row_id

where SRC.noise_words<>TGT.noise_words;