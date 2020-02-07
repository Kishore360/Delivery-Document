 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.change_caused_incident_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT  
FROM  
( SELECT
            COUNT(incident_key) AS incident_count,
            change_request_key AS change_request_key
			FROM fidelity_mdwdb.f_incident_caused_by_change_c   
			WHERE soft_deleted_flag = 'N'   and   change_request_key>0 
        GROUP BY 2 )a
JOIN fidelity_mdwdb.d_change_request c ON  c.row_key= a.change_request_key
where a.incident_count<>c.Incidents_caused_by_change_c 

) temp;






