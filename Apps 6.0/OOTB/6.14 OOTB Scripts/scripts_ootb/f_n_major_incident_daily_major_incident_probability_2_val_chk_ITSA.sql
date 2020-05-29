select case when major_incident_probability_2_value_chk <>0 THEN 'SUCCESS' ELSE 'FAILURE' END as Result,
CASE WHEN major_incident_probability_2_value_chk <>0 THEN 'SUCCESS' ELSE  'major_incident_probability_2 has value 0' END as Message
from 
(select 
    sum(major_incident_probability_2) as major_incident_probability_2_value_chk
  --  sum(failure_probability_2 ) as failure_probability_2_value_chk, 
  --  sum( failure_probability_3 ) as failure_probability_3_value_chk
from #DWH_TABLE_SCHEMA.f_n_major_incident_daily
where soft_deleted_flag='N')a