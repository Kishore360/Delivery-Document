SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_raise_impact_c' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdsdb.u_fmr_operating_committee_final SRC
JOIN fidelity_mdwdb.d_fmr_operating_committee_c trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
join
fidelity_mdwdb.d_fmr_cio_group_c lkp
on  COALESCE( SRC.u_cio_group , 'UNSPECIFIED')=lkp.row_id and SRC.sourceinstance=lkp.source_id
WHERE coalesce(lkp.row_key,case when SRC.u_cio_group is null then 0 else -1 end)  <>trgt1.fmr_cio_group_c_key and SRC.cdctype<>'D'



