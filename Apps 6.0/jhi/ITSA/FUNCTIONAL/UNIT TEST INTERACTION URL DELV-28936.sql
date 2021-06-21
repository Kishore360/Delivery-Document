SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_interaction_c.interaction_source_url_c' ELSE 'SUCCESS' END as Message
FROM jhi_mdsdb.interaction_related_record_final SRC
JOIN jhi_mdsdb.interaction_final SRC1 ON SRC.interaction = SRC1.sys_id
JOIN jhi_mdwdb.d_interaction_c TRGT ON SRC.interaction = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
WHERE CONCAT('<a href=\"','https://janushenderson.service-now.com/','\/interaction.do?sys_id=',SRC1.sys_id,'\" target=\"_blank\">',SRC1.number,'</a>') <> (TRGT.interaction_source_url_c) and TRGT.soft_deleted_flag ='N';