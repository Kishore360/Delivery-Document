
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_contact.vp_base_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM firstam_mdsdb.sys_user_final a 
JOIN firstam_mdwdb.d_internal_contact b ON a.sys_id=b.row_id AND a.sourceinstance=b.source_id
WHERE CASE WHEN
(a.u_job_family LIKE 'IT%' OR a.u_job_family IN ('Information Security Managers','Information Security Professionals'))
AND (a.title like 'VP%' OR a.title like 'Vice%')
AND a.active=1 THEN 'Y' ELSE 'N' END <> b.vp_base_c_flag
AND a.cdctype='X'

) temp;


 
