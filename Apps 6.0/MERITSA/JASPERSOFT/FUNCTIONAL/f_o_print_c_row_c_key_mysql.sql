













SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message  FROM meritsa_mdsdb.o_print_final b 
(select count(1)  cnt
FROM m meritsa_mdsdb.o_print_final SRC
 LEFT JOIN meritsa_mdwdb.f_o_print_c TRG
on TRG.row_id=SRC.row_date and TRG.source_id=SRC.sourceinstance
 LEFT JOIN 	meritsa_mdwdb.d_calendar_date map
on map.row_id = DATE_FORMAT(SRC.row_date,'%Y%m%d')

where coalesce(map.row_key,case when SRC.row_date is null then 0 else -1 end) <> TRG.row_c_key
)A ; 