--Assigned Architect

SELECT b.number,c.item_option_new,b.opened_at,d.name,b.approval AS EA_Approval,b.state AS EA_State,
e.first_name,e.last_name,e.user_name
FROM png_mdsdb.sc_item_option_mtom_final a 
LEFT JOIN png_mdsdb.sc_req_item_final b ON a.request_item=b.sys_id AND a.sourceinstance=b.sourceinstance
LEFT JOIN png_mdsdb.sc_item_option_final c ON a.sc_item_option=c.sys_id AND a.sourceinstance=c.sourceinstance
LEFT JOIN png_mdsdb.item_option_new_final d ON c.item_option_new=d.sys_id and c.sourceinstance=d.sourceinstance
LEFT JOIN png_mdsdb.sys_user_final e ON c.value=e.sys_id AND c.sourceinstance=e.sourceinstance
WHERE b.number IN ('RITM2149460','RITM2147456','RITM2078018');

SELECT b.number,c.item_option_new,b.opened_at,d.name,b.approval AS EA_Approval,b.state AS EA_State,
e.first_name,e.last_name,e.user_name,c.value
FROM png_mdsdb.sc_item_option_mtom_final a 
LEFT JOIN png_mdsdb.sc_req_item_final b ON a.request_item=b.sys_id AND a.sourceinstance=b.sourceinstance
LEFT JOIN png_mdsdb.sc_item_option_final c ON a.sc_item_option=c.sys_id AND a.sourceinstance=c.sourceinstance
LEFT JOIN png_mdsdb.item_option_new_final d ON c.item_option_new=d.sys_id and c.sourceinstance=d.sourceinstance
LEFT JOIN png_mdsdb.sys_user_final e ON c.value=e.sys_id AND c.sourceinstance=e.sourceinstance
WHERE b.number IN ('RITM2215919');

-- Enterprise Application Diagram Submission Form

Select a.u_pg_source_system_id,a.sys_id,b.cmdb_ci,b.number,b.cat_item,c.name
from png_mdsdb.cmdb_ci_final a 
LEFT JOIN png_mdsdb.sc_req_item_final b ON a.sys_id=b.cmdb_ci AND a.sourceinstance=b.sourceinstance and b.cdctype='X'
LEFT JOIN png_mdsdb.sc_cat_item_final c ON b.cat_item=c.sys_id AND b.sourceinstance=c.sourceinstance AND c.cdctype='X'
Where a.u_pg_source_system_id='00230EB055357148'
AND c.name='Enterprise Application Diagram Submission Form'
AND a.cdctype='X';

Select a.u_pg_source_system_id,a.sys_id,b.cmdb_ci,b.number AS RITM,b.opened_at AS RITM_Opened_ON,b.approval AS EA_Diagram_status
,b.cat_item,c.name AS EA_Diagram_SF
from png_mdsdb.pg_mega_cmdb_ci_appl_final a 
LEFT JOIN png_mdsdb.sc_req_item_final b ON a.sys_id=b.cmdb_ci AND a.sourceinstance=b.sourceinstance
LEFT JOIN png_mdsdb.sc_cat_item_final c ON b.cat_item=c.sys_id AND b.sourceinstance=c.sourceinstance 
Where a.u_pg_source_system_id IN ('00230EB055357148','004808385F3B2A0A')
AND c.name='Enterprise Application Diagram Submission Form'
AND a.cdctype='X';

Select a.u_pg_source_system_id,a.sys_id,b.cmdb_ci,b.number AS RITM,b.opened_at AS RITM_Opened_ON,b.approval AS EA_Diagram_status
,b.cat_item,c.name AS EA_Diagram_SF
from png_mdsdb.pg_mega_cmdb_ci_appl_final a 
LEFT JOIN png_mdsdb.sc_req_item_final b ON a.sys_id=b.cmdb_ci AND a.sourceinstance=b.sourceinstance
LEFT JOIN png_mdsdb.sc_cat_item_final c ON b.cat_item=c.sys_id AND b.sourceinstance=c.sourceinstance 
Where a.u_pg_source_system_id IN ('0048033D5F3B1EF7','004805BA5F3B2155','F6F4F73D5F3C773B','CB20CB7D5F726853')
AND c.name='Enterprise Application Diagram Submission Form'
AND a.cdctype='X';

SELECT b.number,Count(distinct d.sys_id)
FROM png_mdsdb.sc_item_option_mtom_final a 
LEFT JOIN png_mdsdb.sc_req_item_final b ON a.request_item=b.sys_id AND a.sourceinstance=b.sourceinstance
LEFT JOIN png_mdsdb.sc_item_option_final c ON a.sc_item_option=c.sys_id AND a.sourceinstance=c.sourceinstance
LEFT JOIN png_mdsdb.item_option_new_final d ON c.item_option_new=d.sys_id and c.sourceinstance=d.sourceinstance
LEFT JOIN png_mdsdb.sys_user_final e ON c.value=e.sys_id AND c.sourceinstance=e.sourceinstance
WHERE d.name='pg_itsm_architect'
group by 1
limit 20;

select b.number,d.name,d.sys_id,e.name,d.*
from png_mdsdb.sc_item_option_mtom_final a
JOIN png_mdsdb.sc_req_item_final b
on a.request_item = b.sys_id and a.sourceinstance = b.sourceinstance
JOIN png_mdsdb.sc_item_option_final c
on a.sc_item_option = c.sys_id and a.sourceinstance = c.sourceinstance
JOIN png_mdsdb.item_option_new_final d
on c.item_option_new = d.sys_id and c.sourceinstance = d.sourceinstance
JOIN png_mdsdb.sys_user_final e
on c.value = e.sys_id and c.sourceinstance = e.sourceinstance
where item_option_new in ('08761a171b049810d59dfea9cc4bcbf0','ef84085bdb99dc101692ea42ca9619b7')
limit 100