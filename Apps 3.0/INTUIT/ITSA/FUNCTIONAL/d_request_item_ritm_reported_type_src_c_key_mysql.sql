SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) cnt from 
intuit_mdsdb.sc_req_item_final b 
join intuit_mdwdb.d_lov a  on COALESCE(CONCAT('CONTACT_TYPE~SC_REQ_ITEM','~','','~','','~',UPPER(b.contact_type)),'UNSPECIFIED')=a.row_id
join intuit_mdwdb.d_request_item c ON a.row_id = b.sys_id  AND a.source_id=b.sourceinstance
where c.ritm_reported_type_src_c_key = coalesce(a.row_key,case when b.contact_type is  null then 0 else -1 end  ))a