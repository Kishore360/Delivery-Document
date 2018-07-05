SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1)cnt  from 
				wow_mdwdb.d_request_item trgt
INNER JOIN wow_mdsdb.sc_req_item_final src 
	ON trgt.row_id = src.sys_id
	AND trgt.source_id = src.sourceinstance
INNER JOIN wow_mdsdb.sc_req_item_ext_final sre
ON src.sys_id = sre.record_id
INNER JOIN wow_mdwdb.d_installable_software_c inst
on inst.row_id = sre.single_software_install
where trgt.single_software_install_c <> case 
                when inst.u_name_c is null then 'UNSPECIFIED' 
                else u_name_c end)a
				
				