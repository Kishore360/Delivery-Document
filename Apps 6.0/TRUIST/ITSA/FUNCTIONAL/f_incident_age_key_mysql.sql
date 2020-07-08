
 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message
from truist_mdwdb.f_incident f  
join
(SELECT
            d_incident.opened_on AS opened_on,
            d_incident.age AS age,
            d_incident.over_due_flag AS over_due_flag,
            d_incident.changed_on AS changed_on,
            d_incident.row_key AS row_key,
            d_incident.active_flag AS active_flag,
            d_incident.due_on AS due_on,
            d_incident.source_id AS source_id,
            d_incident.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.d_incident d_incident      
        INNER JOIN
            truist_mdwdb.d_lov_map d_lov_map 
                ON d_incident.state_src_key = d_lov_map.src_key 
                AND d_lov_map.dimension_class = 'STATE~INCIDENT' 
                AND d_lov_map.dimension_wh_code = 'OPEN'  )t 
                 ON f.incident_key = t.row_key  
where coalesce((select x.row_key  from truist_mdwdb.d_lov x  where (x.dimension_class = 'WH_AGEBUCKET~INCIDENT')   AND floor(t.age) between x.lower_range_value and x.upper_range_value),  -1)  <> f.age_key  and f.age is not null