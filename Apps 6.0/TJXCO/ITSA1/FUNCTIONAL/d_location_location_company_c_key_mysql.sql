
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_request.company_key' ELSE 'SUCCESS' END as Message
 from   tjxco_mdsdb.sn_customerservice_case_final src
left join tjxco_mdsdb.cmn_location_final d on src.u_store=d.sys_id 
 LEFT JOIN tjxco_mdwdb.d_internal_organization LKP 
 ON CONCAT('SUBSIDIARY','~',d.COMPANY)= LKP.row_id
 join tjxco_mdwdb.d_location TRGT  on d.sys_id=TRGT.row_id 
 where location_company_c_key<>coalesce(LKP.row_key,case when d.COMPANY is null then 0 else -1 end) ;
 
 
 