SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.other_acc_cred_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM (
select
a.sys_id, a.sourceinstance, group_concat(c.u_name) AS attribute_name
        FROM
            png_mdsdb.pg_mega_cmdb_ci_appl_final a      
        INNER JOIN
            png_mdsdb.pg_mega_u_m2m_ci_data_privacy_final b
                ON a.sys_id=b.u_configuration_item and a.sourceinstance=b.sourceinstance 
        INNER JOIN
            png_mdsdb.pg_mega_u_data_privacy_attributes_final c  
                ON b.u_data_privacy_attributes=c.sys_id and b.sourceinstance=c.sourceinstance
        WHERE
            1=1 
        GROUP BY
            a.sys_id, a.sourceinstance  

) a11
LEFT JOIN png_mdwdb.d_rita_application_c TRGT ON a11.sys_id=TRGT.row_id AND a11.sourceinstance=TRGT.source_id
WHERE 
IF(a11.attribute_name like '%Other (e.g. customer) account username and password%','Y','N')<>TRGT.other_acc_cred_c_flag
)temp;








