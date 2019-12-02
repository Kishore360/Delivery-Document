SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.source_url' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM ntrs_mdsdb.change_request_final SRC 
LEFT JOIN ntrs_mdwdb.d_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE 
CONCAT('<a href=\"',"https://ven01631.service-now.com/navpage.dochange_request.do?sys_id=SRC.sys_id,'\"target=\"_blank\">',SRC.number,'</a>') <> TRGT.source_url
AND SRC.cdctype='X' )temp; 



