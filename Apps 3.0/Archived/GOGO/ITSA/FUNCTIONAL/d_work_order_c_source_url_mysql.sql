SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.open_to_close_duration' ELSE 'SUCCESS' END as Message
 FROM gogo_mdsdb.wm_order_final SRC
LEFT JOIN gogo_mdwdb.d_work_order_c TRGT
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance= TRGT.source_id  )
where
CONCAT('<a href=\"https://gogo.service-now.com/nav_to.do?uri=wm_order.do?sys_id=',SRC.sys_id,'\" target=\"_blank\">',SRC.number,'</a>') <>source_url


