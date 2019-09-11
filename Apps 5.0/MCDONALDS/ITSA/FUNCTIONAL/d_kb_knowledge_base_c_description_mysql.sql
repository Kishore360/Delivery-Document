SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_item.vendor_ticket_number_c' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.d_kb_knowledge_base_c trgt
RIGHT JOIN mcdonalds_mdsdb.kb_knowledge_base_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE src.description <>trgt.description
;