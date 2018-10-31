SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from(
select count(1) cnt from paloalto_mdwdb.d_change_request a
left join
( SELECT distinct caused_by from paloalto_mdsdb.incident_final ) b
ON a.row_id= b.caused_by
where
a.failure_flag <> CASE WHEN a.close_code_src_code = 'Successful' and b.caused_by is NOT NULL THEN 'Y' ELSE 'N' END 
and  close_code_src_code ='Successful' and  row_id not in ('UNSPECIFIED','UNKNOWN'))a; 


