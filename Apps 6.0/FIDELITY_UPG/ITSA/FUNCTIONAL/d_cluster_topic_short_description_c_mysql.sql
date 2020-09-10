SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_outage.operational_flag_c' ELSE 'SUCCESS' END as Message FROM 
fidelity_mdwdb.d_cluster trg
join  (select cluster_key,group_concat(keyword order by cluster_key) as topic_short_descr from fidelity_mdwdb.d_cluster_keyword
where keyword_weight >= 0.05
group by cluster_key) src on trg.row_key=src.cluster_key 
where COALESCE(src.topic_short_descr,'UNSPECIFIED') <> trg.topic_short_description_c