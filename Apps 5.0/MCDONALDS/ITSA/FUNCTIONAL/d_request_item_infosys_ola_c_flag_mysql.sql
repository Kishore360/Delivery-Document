SELECT CASE WHEN cnt>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_request_item.infosys_ola_c_flag' ELSE 'SUCCESS' END as Message 
FROM (select count(1) as cnt from  mcdonalds_mdsdb.sc_req_item_final src
left join mcdonalds_mdwdb.d_request_item trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE CASE WHEN src.u_infosys_ola = 1 THEN 'Y' ELSE 'N' END <>trgt.infosys_ola_c_flag and src.cdctype='X')ma