
SELECT CaSE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CaSE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message 
FROM (
select count(1) as cnt  from svb_mdwdb. d_incident b
 inner  JOIN  svb_mdsdb.incident_final a
on  b.ROW_ID=SYS_ID and sourceinstance=b.source_id
 where case when a. u_is_form_pre_prod=1 then 'Y' else 'N' end
<> b. form_pre_prod_flag_c)c

