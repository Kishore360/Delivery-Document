SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_raise_impact_c' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdsdb.cmdb_ci_appl_final SRC
JOIN fidelity_mdwdb.d_application trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
join
fidelity_mdwdb.d_fmr_product_c lkp
on  COALESCE(SRC.u_product, 'UNSPECIFIED')=lkp.row_id and SRC.sourceinstance=lkp.source_id
WHERE coalesce(lkp.row_key,case when SRC.u_product is null then 0 else -1 end)  <>trgt1.fmr_product_c_key



