SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM usf_mdsdb.sc_item_option_final SRC 
inner join usf_mdsdb.sc_item_option_mtom_final SRC1
on SRC.sys_id=SRC1.sc_item_option and SRC.sourceinstance = SRC1.sourceinstance
left join usf_mdsdb.question_final SRC2 
on SRC.item_option_new=SRC2.sys_id and SRC.sourceinstance=SRC2.sourceinstance 
join usf_mdsdb.sys_choice_final SRC3
on SRC2.type=SRC3.value and SRC3.element='type' 
and SRC3.name like 'question' 
left join usf_mdsdb.question_choice_final SRC4 
on SRC.value=SRC4.value and SRC.item_option_new=SRC4.question 
and SRC.sourceinstance=SRC4.sourceinstance 
left join usf_workdb.lsm_ls_variable_list SRC5
on SRC2.sys_id=SRC5.row_id and  SRC2.sourceinstance=SRC5.source_id
join usf_workdb.lsm_ls_variable_datatype SRC6 
on SRC3.label = SRC6.variable_type  
 LEFT JOIN usf_mdwdb.f_request_item_variable_c TRGT 
 ON concat(SRC.sys_id,'~',SRC1.request_item)=TRGT.row_id 
  WHERE  CASE WHEN SRC5.variable_type!='Reference' AND SRC6.data_type ='FLAG' AND SRC.value='Yes' THEN 'Y' 
     WHEN SRC5.variable_type!='Reference' AND SRC6.data_type ='FLAG' AND SRC.value='No' THEN 'N' 
	 ELSE null end <> TRGT.flag )t;
