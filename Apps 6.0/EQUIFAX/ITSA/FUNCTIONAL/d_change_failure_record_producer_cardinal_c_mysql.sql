SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_failure.record_producer_cardinal_c' ELSE 'SUCCESS' END as Message 
FROM equifax_mdsdb.change_request_final SRC
 LEFT OUTER JOIN
equifax_mdsdb.sc_cat_item_producer_final sc_cat_item_producer 
ON SRC.u_record_producer=sc_cat_item_producer.sys_id 
and SRC.sourceinstance=sc_cat_item_producer.sourceinstance 
JOIN equifax_mdwdb.d_change_failure TRGT  
ON (SRC.sys_id  = TRGT.row_id  
AND SRC.sourceinstance = TRGT.source_id ) and SRC.cdctype<>'D' and TRGT.current_flag='Y'
LEFT JOIN equifax_mdsdb.us_predictor_variable_c_final LKP
ON CASE WHEN SRC.u_record_producer is null   or sc_cat_item_producer.name is null then 'UNSPECIFIED' 
 WHEN sc_cat_item_producer.sys_id is null then 'UNKNOWN'  else sc_cat_item_producer.name  end=LKP.value and TRGT.source_id=LKP.sourceinstance and LKP.predictor_variable='record_producer_c'
WHERE CASE WHEN LKP.value is null then record_producer_name_c else 'OTHERS' end <>record_producer_cardinal_c and SRC.cdctype<>'D';

