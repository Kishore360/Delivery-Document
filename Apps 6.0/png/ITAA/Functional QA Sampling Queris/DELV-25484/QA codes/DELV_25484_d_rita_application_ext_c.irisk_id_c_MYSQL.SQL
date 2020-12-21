SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.irisk_id_c' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT 
from png_mdwdb.d_archer_irisk_ng_data_for_numerify_report_c  a
LEFT JOIN png_mdwdb.d_rita_application_ext_c b ON a.mega_hex_id_c=b.mega_id_c AND a.source_id=b.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON a.irisk_status_c=LKP.dimension_name and LKP.dimension_class='ASSESSMENT_STATUS~MEGA_APPLICATION'
WHERE COALESCE(a.irisk_id_c,'UNSPECIFIED') <> b.irisk_id_c
AND  a.soft_deleted_flag='N'
) temp; 





 