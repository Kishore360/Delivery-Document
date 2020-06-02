
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_internal_organization.created_by' ELSE 'SUCCESS' END as Message
from  ( SELECT * FROM #MDS_TABLE_SCHEMA.agent_team_final WHERE CDCTYPE<>'D') SRC_P
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization TRGT 
ON (CONCAT('GROUP_LEVEL~',agentteamid) = TRGT.row_id and 
SRC_P.sourceinstance =TRGT.source_id  ) where
null <> COALESCE(TRGT.created_by,'')

