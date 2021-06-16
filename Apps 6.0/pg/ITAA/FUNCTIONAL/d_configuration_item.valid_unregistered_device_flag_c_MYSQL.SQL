SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.valid_unregistered_device_flag_c' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) as CNT 
FROM png_mdwdb.f_configuration_item a 
JOIN png_mdwdb.d_configuration_item b ON a.configuration_item_key=b.row_key 
WHERE 
(
CASE WHEN b.snow_exists_flag_c ='N' AND 
(b.fqdn not like '%pbx%20%' and b.fqdn not like '%pbx%30%' and b.fqdn not like '%pbx%31%'  and b.fqdn not like '%pbx%40%' ) 
THEN 'Y' ELSE 'N' END
) <> b.valid_unregistered_device_flag_c
AND b.source_type_c ='Tenable'
) temp;


 