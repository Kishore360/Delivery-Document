
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_request_c.source_url' ELSE 'SUCCESS' END as Message
FROM paloalto_mdsdb.u_service_request_final	 SRC
 LEFT JOIN paloalto_mdwdb.d_service_request_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 where
CONCAT('<a href=\"https://panservicedesk.service-now.com/nav_to.do?uri=u_service_request.do?sys_id=',SRC.sys_id,'\" target=\"_blank\">',SRC.number,'</a>')
<>TRGT.source_url 