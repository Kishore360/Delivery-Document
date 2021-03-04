SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.pg_bia_rating_for_overall_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdwdb.d_rita_application_ext_c d_rita_application_ext_c   
INNER JOIN 
(
SELECT rating, rita_application_ext_c_key
FROM 
(
SELECT 
greatest( case when  avail.dimension_name in ('UNSPECIFIED','UNKNOWN') THEN -99  
when  avail.dimension_name in ('Very Low') THEN 0  
when  avail.dimension_name in ('Low') THEN 1  
when  avail.dimension_name in ('Medium') THEN 2  
when  avail.dimension_name in ('High') THEN 3  
when  avail.dimension_name in ('Very High') THEN 4  
when  avail.dimension_name in ('Not Performed') THEN -1 
 END,
case 
when  conf.dimension_name in ('UNSPECIFIED','UNKNOWN') THEN -99  
when  conf.dimension_name in ('Very Low') THEN 0  
when  conf.dimension_name in ('Low') THEN 1  
when  conf.dimension_name in ('Medium') THEN 2  
when  conf.dimension_name in ('High') THEN 3  
when  conf.dimension_name in ('Very High') THEN 4  
when  conf.dimension_name in ('Not Performed') THEN -1 END,
case 
when  inter.dimension_name in ('UNSPECIFIED','UNKNOWN') THEN -99  
when  inter.dimension_name in ('Very Low') THEN 0  
when  inter.dimension_name in ('Low') THEN 1  
when  inter.dimension_name in ('Medium') THEN 2  
when  inter.dimension_name in ('High') THEN 3  
when  inter.dimension_name in ('Very High') THEN 4  
when  inter.dimension_name in ('Not Performed') THEN -1 END) AS rating,
d_rita_application_c.rita_application_ext_c_key AS rita_application_ext_c_key,
d_rita_application_c.etl_run_number AS etl_run_number        
FROM
png_mdwdb.d_rita_application_c d_rita_application_c     
INNER JOIN png_mdwdb.d_lov avail ON d_rita_application_c.pg_bia_availability_rating_c_key=avail.row_key 
INNER JOIN png_mdwdb.d_lov conf ON d_rita_application_c.pg_bia_confidentiality_rating_c_key=conf.row_key 
INNER JOIN png_mdwdb.d_lov inter ON d_rita_application_c.pg_bia_rating_for_integrity_c_key=inter.row_key    
WHERE d_rita_application_c.row_key>0
) X 
) t_mdw_max_rating_d_rita_application_c ON d_rita_application_ext_c.row_key=t_mdw_max_rating_d_rita_application_c.rita_application_ext_c_key  
LEFT OUTER JOIN png_mdwdb.d_lov avail ON t_mdw_max_rating_d_rita_application_c.rating=avail.dimension_code 
and (avail.dimension_class ='OVERALL_RATING~MEGA_APPLICATION')  
INNER JOIN png_mdwdb.d_rita_application_c d_rita_application_c ON d_rita_application_ext_c.row_key=d_rita_application_c.rita_application_ext_c_key  
INNER JOIN png_mdwdb.d_lov d_lov ON d_rita_application_c.data_asset_lifecycle_status_key=d_lov.row_key 
and d_lov.dimension_class ='OT_LIFE_CYCLE_STATUS_C~PROCESSING_ACTIVITIES'  
WHERE 
avail.row_key or (d_rita_application_ext_c.irisk_required_c_flag <> 
case 
when d_rita_application_ext_c.created_on<'2020-07-20 00:00:00' and avail.dimension_name in ('High','Very High') then 'Y'  
when d_rita_application_ext_c.created_on>='2020-07-20 00:00:00' and d_lov.dimension_name in ('Design/Build','Qualify/Deliver','Launch/Deploy','Leverage/Optimize') then 'Y' else 'N' end) <> d_rita_application_ext_c.pg_bia_rating_for_overall_c_key
) temp;


  