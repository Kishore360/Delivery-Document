SELECT CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_incident.last_resolved_on' ELSE 'data matched' END as
 Message  from (
select count(1) cnt
 from pan6_mdsdb.sc_req_item_final SRC left join
pan6_mdwdb.d_request_item TGT 
ON
(SRC.sys_id=TGT.row_id and SRC.sourceinstance=TGT.source_id)
LEFT JOIN pan6_mdwdb.d_lov lkp on 
CONCAT('EMPLOYEE_TYPE~SC_REQ_ITEM~',upper(SRC.u_employee_type))=lkp.row_id

WHERE COALESCE(lkp.row_key,CASE WHEN SRC.u_employee_type IS NULL THEN 0 else -1 end)<>(TGT.employee_type_c_key))x