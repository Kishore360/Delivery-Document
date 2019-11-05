SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_location.region_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 whirlpool_mdsdb.cmn_location_final a11
 left join whirlpool_workdb.d_location a12
 ON a11.sys_id = a12.row_id  AND a11.sourceinstance = a12.source_id
where coalesce(a11.u_region,'UNSPECIFIED')<>a12.region_c and a11.CDCTYPE='X'
 )ma
  ;


