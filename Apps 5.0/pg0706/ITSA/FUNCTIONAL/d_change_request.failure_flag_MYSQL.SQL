
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.failure_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.change_request_final SRC 
LEFT JOIN png_mdwdb.d_change_request TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id)
JOIN png_mdwdb.f_change_request ft ON TRGT.row_key=ft.change_request_key
JOIN png_mdwdb.d_calendar_date da ON ft.opened_on_key=da.row_key JOIN png_mdwdb.d_lov LKP 
ON  (concat('CLOSE_CODE~CHANGE_REQUEST','~',(SRC.close_code))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
WHERE CASE WHEN LKP.dimension_name ='Unsuccessful (Failed/Backed-out)'  AND TRGT.unsuccessful_reason_c 
IN ('Change Caused incidents to the business','Backed out successfully but created issues','Change did not meet customer requirements')
THEN 'Y' ELSE 'N'
END <> TRGT.failure_flag
) temp;


