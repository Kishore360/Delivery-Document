select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
from 
truist_mdwdb.f_archer_application_c f_archer_application_c   
    INNER JOIN
       ( SELECT
            MAX(d_o_data_freshness.lastupdated) AS lastupdated,
            d_o_data_freshness.source_id AS source_id,
            MAX(d_o_data_freshness.etl_run_number) AS etl_run_number    
        FROM
           truist_mdwdb.d_o_data_freshness d_o_data_freshness             
        GROUP BY
            2  ) t_d_o_data_freshness_c 
            ON f_archer_application_c.source_id=t_d_o_data_freshness_c.source_id  
    INNER JOIN
        truist_mdwdb.d_archer_application_c d_archer_application_c 
            ON f_archer_application_c.archer_application_c_key=d_archer_application_c.row_key  
            where f_archer_application_c.slo_c <> d_archer_application_c.slo_c