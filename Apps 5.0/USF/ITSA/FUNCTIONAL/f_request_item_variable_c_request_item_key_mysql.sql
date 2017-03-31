SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM usf_mdsdb.sc_item_option_final SRC 
inner join usf_mdsdb.sc_item_option_mtom_final SRC1
on SRC.sys_id=SRC1.sc_item_option and SRC.sourceinstance = SRC1.sourceinstance 
 LEFT JOIN usf_mdwdb.f_request_item_variable_c TRGT 
 ON concat(SRC.sys_id,'~',SRC1.request_item)=TRGT.row_id 
join usf_mdwdb.d_request_item LKP
on SRC1.request_item =  LKP.row_id
  WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.request_item IS NULL THEN 0 else '-1' end)<> TRGT.request_item_key)t;
