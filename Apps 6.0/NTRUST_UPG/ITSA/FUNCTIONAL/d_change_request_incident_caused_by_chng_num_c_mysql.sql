SELECT
CASE WHEN a.CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN a.CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.incident_caused_by_chng_num_c' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.change_request_final SRC
LEFT JOIN ntrust_mdwdb.d_change_request TRGT2 ON (SRC.sys_id=TRGT2.row_id AND SRC.sourceinstance=TRGT2.source_id)
 LEFT OUTER JOIN
(select f_incident.caused_by_change_key AS row_key,
            count(f_incident.incident_key) AS Incs_caused_by_chng,
            group_concat(distinct d_incident.source_url 
        order by
            d_incident.created_on) AS incident_caused_by_chng_num_c,
            f_incident.etl_run_number AS etl_run_number        
        FROM
            ntrust_mdwdb.f_incident f_incident      
        INNER JOIN
            ntrust_mdwdb.d_incident d_incident 
                ON f_incident.incident_key=d_incident.row_key    
        WHERE
            f_incident.caused_by_change_key>0 
            AND f_incident.soft_deleted_flag='N' )f on ON TRGT2.row_key=f.row_key  
			
		where  TRGT2.incident_caused_by_change_c <>  f.incident_caused_by_chng_num_c)a