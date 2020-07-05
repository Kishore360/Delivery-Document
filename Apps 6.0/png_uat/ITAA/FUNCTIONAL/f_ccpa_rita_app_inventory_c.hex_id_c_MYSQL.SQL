SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_ccpa_rita_app_inventory_c.hex_id_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final CCPA 
LEFT JOIN 
(
SELECT substring_index(substring_index(substring_index(ropa_id, '{', -1), '}', 1),';',1) as hex_id,ropa_id,id,RoPA_linked_to_IT_Asset from 
(
select  distinct substring_index(substring_index(RoPA_linked_to_IT_Asset, '\|\|', n), '\|\|', -1) as ropa_id , id , RoPA_linked_to_IT_Asset
from png_mdsdb.pg_ot_ccpa_pa_inventory_c_final 
join 
(
SELECT a.N + b.N * 10 + 1 as n
FROM
(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) a,
(SELECT 0 AS N UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) b 
ORDER BY n
) n 
on char_length(RoPA_linked_to_IT_Asset) - char_length(replace(RoPA_linked_to_IT_Asset, '\|\|', '')) >= n - 1 where RoPA_linked_to_IT_Asset is not null
) a where ropa_id <> ''
) png_numbers
ON CCPA.id = png_numbers.id 
LEFT JOIN png_mdwdb.f_ccpa_rita_app_inventory_c TRGT ON 
CONCAT(COALESCE(png_numbers.hex_id,'UNSPECIFIED'),'~',COALESCE(CCPA.id,'UNSPECIFIED'))=TRGT.row_id
WHERE COALESCE(png_numbers.hex_id,'UNSPECIFIED')<>TRGT.hex_id_c
AND CCPA.cdctype='X'
) temp;
 
 