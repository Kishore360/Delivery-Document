
 
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message from 
(
select 
CASE
			WHEN A.rating <=1 THEN '0 To 1'
			WHEN A.rating >1
				 AND A.rating <=2 THEN '>1 To 2'
			WHEN A.rating >2
				 AND A.rating <=3 THEN '>2 To 3'
			WHEN A.rating >3
				 AND A.rating <=4 THEN '>3 To 4'
			WHEN A.rating >4 THEN '>4 To 5'
			ELSE 'Non Rated'
		END AS rating_range_src,B.rating_range rating_range_trgt
		FROM asu_mdsdb.kb_knowledge_final A
		join asu_mdwdb.d_kb_knowledge_c B on 
		A.sourceinstance=B.source_id 
AND B.ROW_ID=SYS_ID)a
where rating_range_src<>rating_range_trgt;


