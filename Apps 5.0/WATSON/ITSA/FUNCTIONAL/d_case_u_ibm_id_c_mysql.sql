SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_case.u_ibm_id_c' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt
from watson_mdsdb.sn_customerservice_case_final SRC
left join watson_mdsdb.sys_user_final lkp on SRC.contact=lkp.sys_id 
LEFT JOIN watson_mdwdb.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE  COALESCE(lkp.email,'UNSPECIFIED')<>TRGT.u_ibmid_c and SRC.cdctype<>'D')ma;


