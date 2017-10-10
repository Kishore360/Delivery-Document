SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
  FROM whirlpool_mdsdb.incident_final SRC 
 left join whirlpool_mdsdb.sys_user_final LKP on SRC.u_affected_user=LKP.sys_id and SRC.sourceinstance=LKP.sourceinstance
   LEFT JOIN whirlpool_mdwdb.d_lov LKP1 
 ON ( COALESCE(CONCAT('COUNTRIES~U_AD_HOC_REQUEST~~~',UPPER(LKP.u_country_lkp )),'UNSPECIFIED')= LKP1.row_id  )
left join   whirlpool_mdwdb.d_internal_contact f on CONCAT('INTERNAL_CONTACT~',LKP.sys_id)=f.row_id and LKP.sourceinstance=f.source_id
 WHERE COALESCE(LKP1.row_key,CASE WHEN LKP.u_country_lkp   IS NULL THEN 0 else -1 end)<> (f.country_c_key)
;



