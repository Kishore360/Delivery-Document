SELECT 
-- src.sys_id,trgt.row_id,COALESCE(src.u_vendor_ticket,'UNSPECIFIED') as src_vendor_ticket, trgt.vendor_ticket_c as trgt_vendor_ticket
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_request.vendor_ticket_c' ELSE 'SUCCESS' END as Message
FROM molinahealth_mdsdb.change_request_final src 
LEFT JOIN molinahealth_mdwdb.d_change_request trgt ON src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE COALESCE(src.u_vendor_ticket,'UNSPECIFIED') <> trgt.vendor_ticket_c;