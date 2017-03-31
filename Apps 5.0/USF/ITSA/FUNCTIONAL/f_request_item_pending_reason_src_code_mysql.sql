SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_asset.computer_usage_c' ELSE 'SUCCESS' END as Message from
(select count(1) as cnt
FROM usf_mdsdb.sc_req_item_final SRC 
LEFT JOIN usf_mdwdb.f_request_item TRGT 
 ON SRC.sys_id=TRGT.row_id and TRGT.source_id = SRC.sourceinstance
WHERE SRC.u_pending<> TRGT.pending_reason_src_code)t;
