

select case when count(1) <>0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) <>0 then 'datetime_columns PLP is present in lsm_ls_custom_measures_list' 
else 'SUCCESS' end as Message
from <<tenant>>_mdwdb.lsm_ls_custom_measures_list
where custom_column like '%datetime%'
