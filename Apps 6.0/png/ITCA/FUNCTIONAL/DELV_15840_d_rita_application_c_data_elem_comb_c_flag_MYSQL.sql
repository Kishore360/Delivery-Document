SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.data_elem_comb_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 

(

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
(case 
          when a11.attribute_name LIKE '%Data about teens 16-18%' 
            OR a11.attribute_name LIKE '%Other (e.g. customer) account username and password%' 
            OR a11.attribute_name LIKE '%Employee account username and password%' 
            OR a11.attribute_name LIKE '%Birthdate%' 
            OR a11.attribute_name LIKE '%Behavioral Data%' 
            OR a11.attribute_name LIKE '%Browser Cookie Data%' 
            OR a11.attribute_name LIKE '%Email address%' 
            OR a11.attribute_name LIKE '%Employee Band Level%' 
            OR a11.attribute_name LIKE '%Employee T#%' 
            OR a11.attribute_name LIKE '%Employee Work Location%' 
            OR a11.attribute_name LIKE '%Gender%' 
            OR a11.attribute_name LIKE '%Geographic data, Imprecise (not within 3.2187KM)%' 
            OR a11.attribute_name LIKE '%Information which contans\"pseudonymized data\"%' 
            OR a11.attribute_name LIKE '%IP Address%' 
            OR a11.attribute_name LIKE '%Mac Address%' 
            OR a11.attribute_name LIKE '%Marital Status%' 
            OR a11.attribute_name LIKE '%Mobile device Ids%' 
            OR a11.attribute_name LIKE '%Mobile Phone Number%' 
            OR a11.attribute_name LIKE '%Name%' 
            OR a11.attribute_name LIKE '%Phone Numbers (not Mobile)%' 
            OR a11.attribute_name LIKE '%Other demographic and behavioral data gathered online%' 
            OR a11.attribute_name LIKE '%Postal address%' 
            OR a11.attribute_name LIKE '%Salary amount or level%' 
            OR a11.attribute_name LIKE '%Salary or benefits data%' 
            OR a11.attribute_name LIKE '%Zip codes%' 
            OR a11.attribute_name LIKE '%Government ID, government-issued ID%' 
            OR a11.attribute_name LIKE '%Credit card numbers%' 
            OR a11.attribute_name LIKE '%Financial account number%' 
            OR a11.attribute_name LIKE '%Genetic data%' 
            OR a11.attribute_name LIKE '%Biometric data%' 
            OR a11.attribute_name LIKE '%Sex life, sexual orientation questions%' 
            OR a11.attribute_name LIKE '%Data about children under 13%' 
            OR a11.attribute_name LIKE '%Criminal or judicial records%' 
            OR a11.attribute_name LIKE '%Precise geo location data%' 
            OR a11.attribute_name LIKE '%Racial or ethnic origin%' 
            OR a11.attribute_name LIKE '%Political opinions, political party affiliation%' 
            OR a11.attribute_name LIKE '%Trade union membership%' 
            OR a11.attribute_name LIKE '%Protected Health Information (\âPHI\â) as defined by HIPAA%' 
            OR a11.attribute_name LIKE '%Other health or medical data%' 
            OR a11.attribute_name LIKE '%Digital signature data%' 
            OR a11.attribute_name LIKE '%Data about teens between 13-15 years old%' 
            OR a11.attribute_name LIKE '%Consumer account username and password%' 
            OR a11.attribute_name LIKE '%Adverse event information%' 
            OR a11.attribute_name LIKE '%Identification Data%' 
            OR a11.attribute_name LIKE '%Electronic identification data%' 
            OR a11.attribute_name LIKE '%Personal characteristics%' 
            OR a11.attribute_name LIKE '%Family composition%' 
            OR a11.attribute_name LIKE '%Profession%' 
            OR a11.attribute_name LIKE '%Image/sound recordings%'  then 'Y' 
            else 'N' end)<>TRGT.data_elem_comb_c_flag

AND TRGT.soft_deleted_flag ='N'

) temp;




  
