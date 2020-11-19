SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_raise_impact_c' ELSE 'SUCCESS' END as Message
FROM
fidelity_mdsdb.change_request_final SRC
JOIN
 fidelity_mdwdb.d_change_failure trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
join
fidelity_mdwdb.d_lov lkp
on  COALESCE(CONCAT('U_CHANGE_TRIGGER~CHANGE_REQUEST~',SRC.u_change_trigger),'UNSPECIFIED')=lkp.row_id and SRC.sourceinstance=lkp.source_id
WHERE  coalesce(lkp.row_key,case when SRC.u_change_trigger is null then 0 else -1 end)  <>trgt1.change_trigger_src_c_key  and (
coalesce(SRC.work_start,SRC.start_date,SRC.closed_at)>'2019-01-01'
and SRC.u_environment='Production'
and trgt1.current_flag='Y'
and SRC.cdctype<>'D') 



