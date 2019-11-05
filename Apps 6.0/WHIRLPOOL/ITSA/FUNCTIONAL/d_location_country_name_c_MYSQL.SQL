SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_location.country_name_c' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 whirlpool_mdsdb.u_countries_final a11
 left join whirlpool_workdb.d_location a12
 ON a11.sys_id = a12.country_code  AND a11.sourceinstance = a12.source_id
where coalesce(a11.u_country,'UNSPECIFIED')<>a12.country_name_c and a11.CDCTYPE='X'
 )ma
  ;


