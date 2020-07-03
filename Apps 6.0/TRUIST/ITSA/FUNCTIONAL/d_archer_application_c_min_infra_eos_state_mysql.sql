/* select appl.min_infra_eos_state,case
when Y.min_color_code =1 then 'Red'
when Y.min_color_code =2 then 'Orange'
when Y.min_color_code =3 then 'Yellow'
when Y.min_color_code =4 then 'Green'
else 'White' end as der,appl.row_id,appl.soft_deleted_flag */
select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
 from
truist_mdwdb.d_archer_application_c d_archer_application_c   
    LEFT OUTER JOIN
        (SELECT
            MIN(t_min_infra_eos_state_tmp2.least_color) AS min_color_code,
            t_min_infra_eos_state_tmp2.source_id AS source_id,
            t_min_infra_eos_state_tmp2.row_id AS row_id,
            MAX(t_min_infra_eos_state_tmp2.etl_run_number) AS etl_run_number    
        FROM
            (SELECT
            d_archer_application_c.row_id AS row_id,
            COALESCE(LEAST(os_end_of_support_health_code_n,
            db_end_of_support_health_code_n,
            ws_end_of_support_health_code_n),
            5) AS least_color,
            d_archer_application_c.source_id AS source_id,
            d_archer_application_c.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.d_archer_application_c d_archer_application_c      
        LEFT OUTER JOIN
            (SELECT
            d_application_infra_c.app_id AS app_id,
            case  
                when d_application_infra_c.ws_end_of_support_health_code = 'Red' then 1 
                when d_application_infra_c.ws_end_of_support_health_code = 'Orange' then 2 
                when d_application_infra_c.ws_end_of_support_health_code = 'Yellow' then 3 
                when d_application_infra_c.ws_end_of_support_health_code = 'Green' then 4 
                when d_application_infra_c.ws_end_of_support_health_code = 'White' then 5 
            end AS ws_end_of_support_health_code_n,
            case 
                when d_application_infra_c.db_end_of_support_health_code = 'Red' then 1 
                when d_application_infra_c.db_end_of_support_health_code = 'Orange' then 2 
                when d_application_infra_c.db_end_of_support_health_code = 'Yellow' then 3 
                when d_application_infra_c.db_end_of_support_health_code = 'Green' then 4 
                when d_application_infra_c.db_end_of_support_health_code = 'White' then 5 
            end AS db_end_of_support_health_code_n,
            case  
                when d_application_infra_c.os_end_of_support_health_code = 'Red' then 1 
                when d_application_infra_c.os_end_of_support_health_code = 'Orange' then 2 
                when d_application_infra_c.os_end_of_support_health_code = 'Yellow' then 3 
                when d_application_infra_c.os_end_of_support_health_code = 'Green' then 4 
                when d_application_infra_c.os_end_of_support_health_code = 'White' then 5  
            end AS os_end_of_support_health_code_n,
            d_application_infra_c.etl_run_number AS etl_run_number        
        FROM
            truist_mdwdb.d_application_infra_c d_application_infra_c         
        WHERE
            d_application_infra_c.role='Production' 
            and d_application_infra_c.operating_system<>'Non-Operational' ) t_min_infra_eos_state_tmp1 
                ON d_archer_application_c.row_id=t_min_infra_eos_state_tmp1.app_id    
        WHERE
            1=1 
        order by
            d_archer_application_c.row_id ) t_min_infra_eos_state_tmp2             
        GROUP BY
            2,
            3) t_min_infra_eos_state_tmp3 
            ON d_archer_application_c.row_id=t_min_infra_eos_state_tmp3.row_id 
            and d_archer_application_c.source_id=t_min_infra_eos_state_tmp3.source_id  
    where
        d_archer_application_c.min_infra_eos_state <> case  
            when t_min_infra_eos_state_tmp3.min_color_code =1 then 'Red'   
            when t_min_infra_eos_state_tmp3.min_color_code =2 then 'Orange' 
            when t_min_infra_eos_state_tmp3.min_color_code =3 then 'Yellow'  
            when t_min_infra_eos_state_tmp3.min_color_code =4 then 'Green'  
            else 'White' 
        end