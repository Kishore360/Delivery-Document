SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM usf_mdsdb.question_final SRC 
left join usf_mdsdb.sys_choice_final SRC1 
on SRC.type=SRC1.value and SRC1.element='type' and SRC1.name like 'question'
left join usf_workdb.lsm_ls_variable_list SRC2
on SRC.name  = SRC2.variable_name and SRC2.enable_flag='Y' and 
SRC.sys_id =SRC2.row_id 
inner join usf_workdb.lsm_ls_variable_datatype SRC3 on 
SRC2.variable_type=SRC3.variable_type 
LEFT JOIN usf_mdwdb.d_variable_c TRGT 
 ON SRC.sys_id=TRGT.row_id 
WHERE SRC3.data_type<> TRGT.data_type)t;
