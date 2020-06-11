select case when failure_probability_3_value_chk <>0 THEN 'SUCCESS' ELSE 'FAILURE' END as Result,
CASE WHEN failure_probability_3_value_chk <>0 THEN 'SUCCESS' ELSE  'failure_probability_3 has value 0' END as Message
from 
(select 
    sum(failure_probability_3) as failure_probability_3_value_chk
from firstam_mdwdb.d_change_failure
where cdctype<>'D')a