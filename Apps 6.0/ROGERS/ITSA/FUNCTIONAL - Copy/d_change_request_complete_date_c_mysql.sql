SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0 
 THEN 'MDS to DWH data validation failed for d_change_request.sub_status_src_c_key' ELSE 'SUCCESS' END as Message 
 FROM (
select count(1) cnt from rogers_mdwdb.d_change_request a
JOIN
(SELECT documentkey,max(sys_created_on) as sys_created_on from rogers_mdsdb.sys_audit_final 
where tablename = 'change_request' and fieldname ='state' and newvalue = 6
group by 1 
) b ON a.row_id = b.documentkey where complete_date_c <> CONVERT_TZ (b.sys_created_on,'GMT','America/New_York')
and a.cdctype='X' )a;