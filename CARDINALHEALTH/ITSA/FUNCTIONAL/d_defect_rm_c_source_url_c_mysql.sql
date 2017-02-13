SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM cardinalhealth_mdwdb.d_defect_rm_c d
JOIN cardinalhealth_mdsdb.rm_defect_final i ON d.row_id=i.sys_id 
	AND d.source_id=i.sourceinstance
where d.source_url_c <> CONCAT('<a href=\"','https://cardinal.service-now.com/nav_to.do?uri=','rm_defect.do?sys_id=',i.sys_id,'\" target=\"_blank\">',i.number,'</a>') 

