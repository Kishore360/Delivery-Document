SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_rita_application_data_elements_c.png_ot_data_elements_collected_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM 
(
SELECT CONCAT(app.sys_id,'~',coalesce(att.ATTRIBUTE_NAME,'UNSPECIFIED')) AS row_id ,app.sys_id as app_hex ,
coalesce(att.ATTRIBUTE_NAME,'UNSPECIFIED') as ATTRIBUTE_NAME ,
app.sourceinstance from png_mdsdb.pg_mega_cmdb_ci_appl_final as app 
left join 
(
SELECT sha1(lower(a.u_name)) as ATTRIBUTE_NAME,a.sourceinstance,b.u_configuration_item as app_hex,count(1) 
from png_mdsdb.pg_mega_u_data_privacy_attributes_final a 
JOIN png_mdsdb.pg_mega_u_m2m_ci_data_privacy_final b 
ON a.sys_id = b.u_data_privacy_attributes and a.sourceinstance = b.sourceinstance

inner join png_mdsdb.pg_ot_data_elements_map_final as de on a.u_name = de.data_element
where b.u_configuration_item is not null and a.u_name is not null and a.u_name <> '' and b.cdctype='X'
group by 1,2,3) att
on app.sys_id = att.app_hex and app.sourceinstance = att.sourceinstance and app.cdctype='X'
) SRC
LEFT JOIN png_mdwdb.f_rita_application_data_elements_c TRGT ON SRC.row_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN  png_mdwdb.d_png_ot_data_elements_collected_c LKP ON COALESCE(SRC.ATTRIBUTE_NAME,'UNSPECIFIED')=LKP.row_id
WHERE COALESCE (LKP.row_key , CASE WHEN SRC.ATTRIBUTE_NAME iS NULL THEN 0 ELSE -1 END)<>TRGT.png_ot_data_elements_collected_c_key
) temp;


