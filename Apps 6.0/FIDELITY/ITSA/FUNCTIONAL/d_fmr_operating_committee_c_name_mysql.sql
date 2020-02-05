SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_raise_impact_c' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdsdb.u_fmr_operating_committee_final SRC
JOIN fidelity_mdwdb.d_fmr_operating_committee_c trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
WHERE coalesce(SRC.u_display_name,'unspecified') <>trgt1.name and SRC.cdctype<>'D'
