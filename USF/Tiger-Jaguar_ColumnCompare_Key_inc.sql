SELECT case when count(*) = TigerCount then 'SUCCESS' else 'FAILURE' end as Result,
case when count(*) =TigerCount then  'SUCCESS' else  
CONCAT('For #JAGUAR_TABLE_NAME.#COLUMN_NAME records Matched:', CAST(COUNT(*) AS CHAR(10)), '. TigerCount: '
,TigerCount,'. JaguarCount: ',JaguarCount)
end as Message
FROM 
(SELECT t.row_id, t.lkp_row_id, Ttotal.cnt as TigerCount,Jtotal.cnt as JaguarCount
FROM
 (
   SELECT t1.row_id, l1.row_id as lkp_row_id
   FROM #TIGER_DWH_SCHEMA.#TIGER_TABLE_NAME t1
   JOIN #TIGER_DWH_SCHEMA.#TIGER_LKP_NAME l1
   ON(l1.row_key=t1.#COLUMN_NAME)
   WHERE date_format(t1.dw_updated_on,'%Y%m%d')=#TIGER_DW_UPADTED
   AND t1.row_key not in (0,-1)
   UNION ALL
   SELECT t2.row_id, l2.row_id as lkp_row_id
   FROM #JAGUAR_DWH_SCHEMA.#JAGUAR_TABLE_NAME t2   
   JOIN #JAGUAR_DWH_SCHEMA.#JAGUAR_LKP_NAME l2
   ON(l2.row_key=t2.#COLUMN_NAME)
   WHERE t2.row_key not in (0,-1)
)  t, (SELECT count(*) cnt
   FROM #TIGER_DWH_SCHEMA.#TIGER_TABLE_NAME WHERE row_key not in (0,-1)
   AND  date_format(dw_updated_on,'%Y%m%d')=#TIGER_DW_UPADTED) Ttotal
,(SELECT count(*) cnt
   FROM #JAGUAR_DWH_SCHEMA.#JAGUAR_TABLE_NAME  WHERE row_key not in (0,-1)) Jtotal
GROUP BY t.row_id, t.lkp_row_id
HAVING COUNT(*) =2
) Result