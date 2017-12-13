-- DELV-9833 and DELV-9834: sc_request_final.site_group_nyp_c_MYSQL.SQL 

-- ITSM_Request Task_C, ITSM_Request Item_C
-- sc_request.opened_by => sys_user.location => cmn_location.u_site_group_nyp"
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for sc_request_final.site_group_nyp_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM nypres_mdsdb.sc_request_final SRC 
LEFT JOIN nypres_mdsdb.sys_user_final SRC1 ON SRC.opened_by=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance
LEFT JOIN nypres_mdsdb.cmn_location_final SRC2 ON SRC1.location=SRC2.sys_id AND SRC1.sourceinstance=SRC2.sourceinstance
LEFT JOIN nypres_mdwdb.d_location TRGT ON SRC2.sys_id=TRGT.row_id AND SRC2.sourceinstance=TRGT.source_id
WHERE coalesce(SRC2.u_site_group_nyp,'UNSPECIFIED')<>TRGT.site_group_nyp_c
)temp; 