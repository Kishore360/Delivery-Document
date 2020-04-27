SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'Data mismatch' ELSE 'SUCCESS' END as Message
-- select src.sys_id, trgt.row_id,CONCAT('<a href="','@#ITSM_SYSTEM_SOURCE_URL@#', 'src.do?sys_id=',src.sys_id, '\" target=\"_blank\">',src.number,'</a>'),trgt.source_url
FROM bbandt_mdwdb.d_rm_release_c trgt
RIGHT JOIN bbandt_mdsdb.rm_release_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where  CONCAT('<a href="','https://bbitprod.service-now.com/nav_to.do?uri=', 'rm_release.do?sys_id=',src.sys_id,
                '\" target=\"_blank\">',src.number,'</a>')<>trgt.source_url
and src.cdctype='X';