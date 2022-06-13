

with recursive cte_ALPHABET as (
	SELECT CHAR(ASCII('A')) AS letter
    UNION ALL
    SELECT CHAR(ASCII(letter)+1) FROM cte_ALPHABET WHERE letter <> 'L'
),
#SELECT * FROM cte_seat_arrangement # A TO L PRINT
cte_seat as (
	SELECT 1 AS Nmbr
    UNION ALL
    SELECT Nmbr+1 FROM cte_seat WHERE Nmbr < 10
),
#SELECT * FROM cte_seat # 1 TO 10 NUMBER
CTE_FINAL AS (
	SELECT letter,letter+TRIM(STR(Nmbr)) AS Seat_no FROM cte_ALPHABET CROSS JOIN cte_seat
)
select letter as row,String_agg(Seat_no,',') within group(order by letter) from CTE_FINAL #cross product of letter & seat number
group by letter;