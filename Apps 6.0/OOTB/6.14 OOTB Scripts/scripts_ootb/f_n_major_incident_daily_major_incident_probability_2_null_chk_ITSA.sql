select case when major_incident_probability_2_null_chk <>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN major_incident_probability_2_null_chk <>0 THEN ' major_incident_probability_2 has null' ELSE  'SUCCESS' END as Message
from 
(

select 
    count(case when major_incident_probability_2 is null then 1 else 0 end) as major_incident_probability_2_null_chk
from #DWH_TABLE_SCHEMA.f_n_major_incident_daily
where soft_deleted_flag = 'N' 
and etl_run_number<>(Select max(etl_run_number) from #DWH_TABLE_SCHEMA.f_n_major_incident_daily) and row_key not in (-1,0)
)a