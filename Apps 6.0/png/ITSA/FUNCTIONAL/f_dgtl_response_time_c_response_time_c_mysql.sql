SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_dgtl_response_time_c.response_time_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM
 png_mdsdb.responsetime_day_final SRC                 
 INNER JOIN
 png_mdsdb.synthetic_monitor_final SRC1 
ON SRC.sourceinstance=SRC1.sourceinstance
AND SRC.SYNTHETIC_TEST=SRC1.entityId
LEFT JOIN png_mdwdb.f_dgtl_response_time_c TRGT 
ON concat ( COALESCE(SRC.SYNTHETIC_TEST,'UNSPECIFIED'),'~',
COALESCE(date(CONVERT_TZ(from_unixtime(SRC.timestamp/1000),'GMT','America/New_York')),'UNSPECIFIED')  )
=	TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  CAST(AVG*0.001 as decimal(28,10)) <> TRGT.response_time_c
AND SRC.cdctype<>'D'
) temp;


