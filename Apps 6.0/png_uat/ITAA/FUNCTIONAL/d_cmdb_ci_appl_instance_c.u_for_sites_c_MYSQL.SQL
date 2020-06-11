SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_cmdb_ci_appl_instance_c.u_for_sites_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT 
site_c,instance_key 
FROM 
(
SELECT 
group_concat(distinct b.location_name order by 1) AS site_c,
a.cmdb_ci_appl_instance_c_key as instance_key
FROM png_mdwdb.f_application_using_sites_c a 
JOIN png_mdwdb.d_location b ON a.location_site_c_key=b.row_key
WHERE a.cmdb_ci_appl_instance_c_key > 0 
AND a.soft_deleted_flag='N'
group by a.cmdb_ci_appl_instance_c_key
) X
) SRC 
JOIN png_mdwdb.d_cmdb_ci_appl_instance_c TRGT ON SRC.instance_key=TRGT.row_key
WHERE SRC.site_c <>TRGT.u_for_sites_c
) temp; 


