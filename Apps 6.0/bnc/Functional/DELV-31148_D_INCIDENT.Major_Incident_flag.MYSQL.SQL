SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for D_INCIDENT.Major_Incident_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM "BNC_CCS_PD_DB"."MDSDB"."HLX_HPD_HELP_DESK_FINAL" hpd_help_desk
JOIN "BNC_CCS_PD_DB"."MDW"."D_INCIDENT" b ON hpd_help_desk.Incident_Number=b.row_id AND hpd_help_desk.sourceinstance=b.source_id 
WHERE 
CASE WHEN ((hpd_help_desk.Impact IN ('1-Extensive/Widespread','2-Significant/Large')) 
OR (hpd_help_desk.Impact='3-Moderate/Limited' AND hpd_help_desk.Urgency='1-Critical')) THEN 'Y' ELSE 'N' END <> b.Major_Incident_flag
AND hpd_help_desk.cdctype<>'D'
) temp;





