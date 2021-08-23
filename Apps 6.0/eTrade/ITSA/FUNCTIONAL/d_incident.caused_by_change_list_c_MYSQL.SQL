SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident.caused_by_change_list_c' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT
FROM etrade_mdwdb.d_incident SRC 
JOIN 
(
Select incident_key,caused_by_change_list_c
FROM 
(
Select a.incident_key AS incident_key,
group_concat(distinct b.change_request_number order by b.change_request_number ASC SEPARATOR ' , ') AS caused_by_change_list_c
FROM etrade_mdwdb.f_caused_by_change  a
JOIN etrade_mdwdb.d_change_request b ON a.change_request_key=b.row_key 
Where a.soft_deleted_flag='N'
group by a.incident_key
) X 
) Y ON SRC.row_key=Y.incident_key
WHERE Y.caused_by_change_list_c<>SRC.caused_by_change_list_c
) temp; 





  