
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_request_c.description' ELSE 'SUCCESS' END as Message 
from paloalto_mdwdb.d_service_request_c d
JOIN paloalto_mdsdb.u_service_request_final i ON d.row_id=i.sys_id AND d.source_id=i.sourceinstance
where d.soft_deleted_flag='N' and 
d.description<>i.description;