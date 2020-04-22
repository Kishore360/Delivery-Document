SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_incident_ext_c.incident_component_c_key' ELSE 'SUCCESS' END as Message
FROM
(SELECT Count(1) as CNT
FROM    png_mdsdb.incident_final src
 JOIN png_mdwdb.d_incident_ext_c trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
left JOIN png_mdwdb.d_lov lkp
ON CONCAT('LOSS_REPUTATION~INCIDENT~',upper(src.u_loss_of_reputation_new))=lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.u_loss_of_reputation_new IS NULL THEN 0 else -1 end)<> trgt.incident_loss_of_reputation_c_key
) temp;