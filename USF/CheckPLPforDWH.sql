

select case when count(1) <>0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) <>0 then 'PLP for target_schema=''dwh'' present in lsm_ls_custom_measures_list' else 'SUCCESS' end as Message
FROM usf_mdwdb.lsm_ls_custom_measures_list
WHERE target_schema = 'dwh'
and enable_flag = 'Y'
