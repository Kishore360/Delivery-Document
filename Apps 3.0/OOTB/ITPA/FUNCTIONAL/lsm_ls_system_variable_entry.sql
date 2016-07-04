
SELECT CASE WHEN count(1) = 1 THEN 'SUCCESS'  ELSE 'FAILURE' END as Result,
 CASE WHEN count(1) =1 THEN  'SUCCESS' ELSE 'lsm_ls_system_variable does not contain correct entry for reported_type'  END as Message
 from <<tenant>>_workdb.lsm_ls_system_variables
 where class_value=#classvalue
 and table_value='new_call'
 and property=#property
 and column_value=#column_value
 and enable_flag='Y'
 and is_customization='N'
