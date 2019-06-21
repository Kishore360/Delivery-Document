SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.unisys_email_portal_ola_c_flag' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.d_request_item trgt
RIGHT JOIN mcdonalds_mdsdb.sc_req_item_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE CASE WHEN src.u_unisys_email_portal_ola = 1 THEN 'Y' ELSE 'N' END <>unisys_email_portal_ola_c_flag
;