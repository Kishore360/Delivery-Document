SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
 ,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
 ELSE 'Data Matched' END AS Message 
 FROM
starwood_mdwdb.f_incident TGT
JOIN starwood_mdsdb.incident_final SRC
ON TGT.row_id = SRC.sys_id
AND TGT.source_id = SRC.sourceinstance
LEFT JOIN starwood_mdsdb.cmn_location_final LKP4
ON SRC.location= LKP4.sys_id
AND SRC.sourceinstance = LKP4.sourceinstance
left join starwood_mdwdb.d_lov lov on 
lov.row_id = COALESCE(CONCAT('TYPE~LOCATION~~~',upper(LKP4.u_type)),'UNSPECIFIED')
where TGT.type_c_key <> lov.row_key



