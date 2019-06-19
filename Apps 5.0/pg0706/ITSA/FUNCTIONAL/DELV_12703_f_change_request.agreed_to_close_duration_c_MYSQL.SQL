


SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_change_request.agreed_to_close_duration_c' ELSE 'SUCCESS' END as Message
FROM 
--  If the Query is failed this will be due to DAY light savings 
(
SELECT Count(1) AS CNT 
FROM png_mdsdb.change_request_final SRC 
LEFT JOIN png_mdwdb.f_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN png_mdwdb.d_lov LKP ON (CONCAT('STATE','~','CHANGE_REQUEST','~~~',SRC.state)=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE 
(CASE WHEN 
LKP.dimension_name ='Closed' THEN 
timestampdiff(second,
CONVERT_TZ(SRC.u_pg_requested_delivery_date,'GMT','America/New_York'),
coalesce(CONVERT_TZ(SRC.closed_at,'GMT','America/New_York'),CONVERT_TZ(SRC.sys_updated_on,'GMT','America/New_York')))
ELSE timestampdiff(second,
CONVERT_TZ(SRC.u_pg_requested_delivery_date,'GMT','America/New_York'),
(SELECT Max(x.lastupdated) FROM png_workdb.o_data_freshness x))
END )<>TRGT.agreed_to_close_duration_c
) temp;



