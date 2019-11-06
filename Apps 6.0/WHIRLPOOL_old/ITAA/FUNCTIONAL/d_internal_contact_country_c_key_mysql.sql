SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
  FROM( select count(1) as cnt 
FROM  whirlpool_mdsdb.sys_user_final SRC
left join   whirlpool_mdwdb.d_internal_contact f on CONCAT('INTERNAL_CONTACT~',SRC.sys_id)=f.row_id and SRC.sourceinstance=f.source_id
LEFT JOIN whirlpool_mdwdb.d_lov LKP1
ON ( COALESCE(CONCAT('COUNTRIES~U_AD_HOC_REQUEST~~~',UPPER(SRC.u_country_lkp )),'UNSPECIFIED')= LKP1.row_id 
and LKP1.source_id = SRC.sourceinstance   )
WHERE COALESCE(LKP1.row_key,CASE WHEN SRC.u_country_lkp   IS NULL THEN 0 else -1 end)<>(f.country_c_key)
and SRC.cdctype ='X')ma


