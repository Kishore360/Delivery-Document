
SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT  >0 THEN 'MDS to DWH data validation failed for d_case.first_severity_src_c_key' ELSE 'SUCCESS' END as Message
from (
Select count(1) as CNT
FROM ibmwatson_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN ibmwatson_mdwdb.d_case TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
JOIN 
(
SELECT sys.documentkey,sys.newvalue,sys.oldvalue  
FROM ibmwatson_mdsdb.sys_audit_final sys 
JOIN 
(
select documentkey,oldvalue,min(sys_created_on) as created_on from ibmwatson_mdsdb.sys_audit_final
where tablename= 'sn_customerservice_case' and fieldname='priority'
group by 1
) d 
ON sys.documentkey=d.documentkey AND sys.sys_created_on=d.created_on
where tablename= 'sn_customerservice_case' and fieldname='priority'
) x ON TRGT.row_id=x.documentkey
JOIN ibmwatson_mdwdb.d_lov LKP ON coalesce(concat('PRIORITY~CASE~~~',coalesce(x.oldvalue,x.newvalue,SRC.priority)),'UNSPECIFIED') =LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.priority IS NULL THEN 0 ELSE '-1' END)<>TRGT.first_severity_src_c_key
) temp;

