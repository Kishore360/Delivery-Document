SELECT CASE
WHEN Count(1) > 0 THEN 'FAILURE'
ELSE 'SUCCESS'
END AS Result,
CASE
WHEN Count(1) > 0 THEN
'MDS to DWH data validation failed for f_change_request.failure_flag'
ELSE 'SUCCESS'
END AS Message
FROM gogo_mdsdb.change_request_final SRC
LEFT JOIN gogo_mdwdb.d_change_request TRGT
ON ( SRC.sys_id = TRGT.row_id
AND SRC.sourceinstance = TRGT.source_id )
JOIN gogo_mdwdb.d_lov_map br
ON (SRC.review_status = br.dimension_code
)
WHERE CASE when
u_closure_code IN ('Successful', 'Partially Successful') THEN 'N' ELSE 'Y' END <> TRGT.failure_flag