-- DELV-9830 : incident_final_caller_id.site_group_nyp_c_MYSQL.SQL 
-- incident.caller_id => sys_user.location => cmn_location.u_site_group_nyp"
-- ITSM_Incident_C & ITSM_Reassignment_C
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for incident_final_caller_id.site_group_nyp_c' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) as CNT 
FROM nypres_mdsdb.incident_final SRC 
LEFT JOIN nypres_mdsdb.sys_user_final SRC1 ON SRC.caller_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN nypres_mdsdb.cmn_location_final SRC2 ON SRC1.location=SRC2.sys_id AND SRC1.sourceinstance=SRC2.sourceinstance
LEFT JOIN nypres_mdwdb.d_location TRGT ON SRC2.sys_id=TRGT.row_id AND SRC2.sourceinstance=TRGT.source_id
WHERE coalesce(SRC2.u_site_group_nyp,'UNSPECIFIED')<>TRGT.site_group_nyp_c
)temp;