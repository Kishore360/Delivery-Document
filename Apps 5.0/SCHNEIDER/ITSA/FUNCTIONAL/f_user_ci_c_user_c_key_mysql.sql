SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_user_ci_c.user_c_key' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.v_gs_installed_software_final SRC 
inner join schneider_mdsdb.v_r_system_final SRC1 on SRC.resourceid = SRC1.resourceid and SRC.sourceinstance = SRC1.sourceinstance
 and SRC.productname0 is not null 
JOIN schneider_mdwdb.f_user_ci_c TRGT
ON CONCAT(SRC.resourceid,'~',SRC.groupid)  = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id
inner join (select employeeid0, sourceinstance, max(resourceid) as latest_usr from schneider_mdsdb.v_r_user_final where  employeeid0 is not null and (employeeid0, sourceinstance,creation_date0) in 
(select employeeid0, sourceinstance, max(creation_date0) from schneider_mdsdb.v_r_user_final where employeeid0 is not null  group by 1,2)
group by 1, 2) usr on SRC1.sourceinstance = usr.sourceinstance and COALESCE(SRC1.user_name0,'UNSPECIFIED')= usr.employeeid0
  join schneider_mdwdb.d_internal_contact lkp on COALESCE(SRC1.user_name0,'UNSPECIFIED') = lkp.row_id
 WHERE COALESCE(lkp.row_key , case when SRC1.user_name0 is null then 0 else  -1 end) <> (TRGT.user_c_key) 
