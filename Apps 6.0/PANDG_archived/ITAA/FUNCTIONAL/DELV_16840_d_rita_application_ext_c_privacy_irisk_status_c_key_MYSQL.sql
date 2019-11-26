SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_ext_c.privacy_irisk_status_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM (
SELECT ra.name,ra.sourceinstance,
	CASE WHEN sum(case when irc.MEGA_HEX_ID= ra.name then 1 else 0 END) > 0 THEN 
			  CASE WHEN sum(case when irc.MEGA_HEX_ID= ra.name AND irc.Assessment_Status NOT IN ('Complete','Cancelled')  then 1 else 0 END) = 0 
			  THEN 'Complete' ELSE 'Incomplete' END 
			  ELSE  'N/A' END  																				as privacy_irisk_status  

FROM 		png_mdsdb.pg_mega_pgb_application_rita_final as ra
LEFT JOIN 	png_mdsdb.pg_mega_privacy_irisk_pia_checklist_status_final as irc
ON 			ra.name = irc.MEGA_HEX_ID 
AND 		ra.sourceinstance = irc.sourceinstance 
AND 		irc.cdctype ='X'

WHERE 		ra.cdctype = 'X'
GROUP BY 1,2




) SRC 
LEFT JOIN png_mdwdb.d_rita_application_ext_c TRGT ON SRC.NAME=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN png_mdwdb.d_lov LKP ON CONCAT('PRIVACY_IRISK_STATUS~MEGA_APPLICATION~',SRC.privacy_irisk_status)=LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.privacy_irisk_status IS NULL THEN 0 ELSE -1 END)<>TRGT.privacy_irisk_status_c_key
) temp;