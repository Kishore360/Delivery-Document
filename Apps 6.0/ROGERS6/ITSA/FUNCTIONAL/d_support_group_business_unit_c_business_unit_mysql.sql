SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) 
 THEN 'MDS to DWH data validation failed for d_support_group_business_unit_c.business_unit' ELSE 'SUCCESS' END as Message
-- select distinct COALESCE(SRC.u_business_unit,'UNSPECIFIED'),TRGT.business_unit,SRC.cdctype
 FROM rogers6_mdsdb.u_support_group_businessunit_final  SRC  
JOIN rogers6_mdwdb.d_support_group_business_unit_c TRGT 
ON SRC.sys_id= TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id 
 WHERE  COALESCE(SRC.u_business_unit,'UNSPECIFIED')<>TRGT.business_unit
and SRC.CDCTYPE='X';
