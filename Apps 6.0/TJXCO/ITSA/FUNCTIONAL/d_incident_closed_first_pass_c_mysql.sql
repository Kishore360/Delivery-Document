SELECT CASE WHEN CNT> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT>0 THEN 'MDS to DWH data validation failed for incident.u_category' ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) AS CNT 
FROM tjxco_mdsdb.incident_final  a
join tjxco_mdwdb.d_incident b
ON a.sys_id = b.row_id and a.sourceinstance=b.source_id
where a.u_closed_first_pass<>b.closed_first_pass_c
) temp;