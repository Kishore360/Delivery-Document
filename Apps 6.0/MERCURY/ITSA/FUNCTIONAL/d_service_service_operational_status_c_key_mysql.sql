 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (SELECT count(1) as cnt
FROM mercury_mdsdb.problem_final  SRC 
left JOIN  mercury_mdsdb.cmdb_ci_service_final LKP 
ON (SRC.cmdb_ci = LKP.sys_id  
AND SRC.sourceinstance = LKP.sourceinstance )  
join mercury_mdwdb.d_service TRGT
on concat('BUSINESS_SERVICE~',LKP.sys_id)=TRGT.row_id and LKP.sourceinstance=TRGT.source_id
join mercury_mdwdb.d_lov LKP2 
on concat('OPERATIONAL_STATUS~BUSINESS_SERVICE~',LKP.operational_status)=LKP2.row_id and LKP.sourceinstance=LKP2.source_id
where TRGT.service_operational_status_c_key<>coalesce(LKP2.row_key,case when coalesce(SRC.cmdb_ci,LKP.operational_status) is null then 0 else -1 end))a
