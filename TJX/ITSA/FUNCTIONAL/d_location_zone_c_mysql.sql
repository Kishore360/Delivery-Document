SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.state_src_key' ELSE 'SUCCESS' END as Message
 FROM 
tjx_mdsdb.cmn_location_final cmn join 
tjx_mdsdb.u_location_district_final ldf on ldf.sys_id=cmn.u_district AND cmn.sourceinstance= ldf.sourceinstance 

join tjx_mdsdb.u_location_region_final  lrf on lrf.sys_id=ldf.u_region AND cmn.sourceinstance= lrf.sourceinstance 

 JOIN tjx_mdsdb. u_location_zone_final LKP  ON  LKP.sys_id=lrf.u_zone AND cmn.sourceinstance= LKP.sourceinstance 

 LEFT JOIN tjx_mdwdb.d_location TRGT 
 ON (cmn.sys_id =TRGT.row_id  
 AND cmn.sourceinstance= TRGT.source_id  )
 WHERE LKP. name <> (TRGT.zone_c)