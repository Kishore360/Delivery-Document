SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM pgi_mdwdb.f_change_request trgt
		JOIN pgi_mdsdb.change_request_final src
		ON trgt.source_id = src.sourceinstance and trgt.row_id=src.sys_id
		WHERE trgt.open_to_close_duration <> CASE WHEN src.CLOSED_AT  < src.sys_created_on 
		THEN  NULL  ELSE TIMESTAMPDIFF(SECOND,CONVERT_TZ(
		src.sys_created_on,'GMT','UTC'),CONVERT_TZ(src.CLOSED_AT,'GMT','UTC')) end)tmp