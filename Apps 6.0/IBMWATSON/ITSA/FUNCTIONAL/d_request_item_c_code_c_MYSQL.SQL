SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request_item.c_code_c ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from ibmwatson_mdwdb.d_request_item trgt
INNER JOIN ibmwatson_mdsdb.sc_req_item_final src 
	ON trgt.row_id = src.sys_id AND trgt.source_id = src.sourceinstance
Left JOIN ibmwatson_mdsdb.sc_req_item_ext_final sre
	ON src.sys_id = sre.record_id  and src.sourceinstance = sre.sourceinstance
    INNER JOIN ibmwatson_mdsdb.u_c_code_final inst
	on inst.sys_id = sre.c_code_new and sre.sourceinstance = inst.sourceinstance
where trgt.c_code_c<>coalesce(inst.u_value,'UNSPECIFIED')
)ma	