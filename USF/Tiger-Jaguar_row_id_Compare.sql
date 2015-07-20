SELECT case when count(1) = TigerCount then 'SUCCESS' else 'FAILURE' end as Result,
case when count(1) =TigerCount then  'SUCCESS' else  
CONCAT('For #JAGUAR_TABLE_NAME.row_id Matched:', CAST(COUNT(1) AS CHAR(10)), '. TigerCount: '
,TigerCount,'. JaguarCount: ',JaguarCount)
end as Message
FROM 
(SELECT t.row_id, Ttotal.cnt as TigerCount,Jtotal.cnt as JaguarCount
FROM
 (
   SELECT t1.row_id, 'TIGER'
   FROM #TIGER_DWH_SCHEMA.#TIGER_TABLE_NAME t1
   WHERE  date_format(t1.dw_updated_on,'%Y%m%d')=#TIGER_DW_UPADTED
   AND t1.row_key not in (0,-1)
   UNION ALL
   SELECT t2.row_id, 'JAGUAR'
   FROM #JAGUAR_DWH_SCHEMA.#JAGUAR_TABLE_NAME  t2
   WHERE t2.row_key not in (0,-1)
)  t, (SELECT count(1) cnt
   FROM #TIGER_DWH_SCHEMA.#TIGER_TABLE_NAME WHERE row_key not in (0,-1)) Ttotal
,(SELECT count(1) cnt
   FROM #JAGUAR_DWH_SCHEMA.#JAGUAR_TABLE_NAME  WHERE row_key not in (0,-1)) Jtotal
GROUP BY t.row_id
HAVING COUNT(1) =2
) Result
