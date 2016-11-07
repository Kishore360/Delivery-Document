
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select CONCAT('<a href=\"','https://asu.service-now.com/navpage.do/','kb_knowledge.do?sys_id=',A.sys_id,'\" target=\"_blank\">',A.number,'</a>') AS source_url,B.source_url
source_url_trgt,A.rating rating_src,B.rating rating_trgt
FROM asu_mdsdb.kb_knowledge_final A
		join asu_mdwdb.d_kb_knowledge_c B on 
		A.sourceinstance=B.source_id 
AND B.ROW_ID=SYS_ID)a
where source_url<>source_url_trgt
or rating_src<>rating_trgt;


