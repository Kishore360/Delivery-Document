 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
SELECT count(1) as cnt
FROM mercury_mdsdb.problem_final  SRC 
left JOIN mercury_mdsdb.cmdb_ci_service_final LKP 
ON (SRC.cmdb_ci = LKP.sys_id  
AND SRC.sourceinstance = LKP.sourceinstance )  
left join  mercury_mdwdb.d_service TRGT
on coalesce(concat('BUSINESS_SERVICE~',LKP.sys_id),0)=TRGT.row_id and LKP.sourceinstance=TRGT.source_id
where case when LKP.u_app=1 then 'Y' else 'N' end<>TRGT.application_flag_c)a ;