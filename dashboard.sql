#Eventlog health STATUS
SELECT CONCAT(table_schema, '.', table_name) AS `Table`, CONCAT(ROUND(table_rows / 1000000, 2), 'M') AS `ROWS`, CONCAT(ROUND(data_length / ( 1024 * 1024 * 1024 ), 2), 'Gb') AS `DATA`, CONCAT(ROUND(index_length / ( 1024 * 1024 * 1024 ), 2), 'Gb') AS idx, CONCAT(ROUND(( data_length + index_length ) / ( 1024 * 1024 * 1024 ), 2), 'Gb') AS total_size, ROUND(index_length / data_length, 2) AS idxfrac FROM information_schema.TABLES ORDER BY data_length + index_length DESC LIMIT 20;

#Live query display
SELECT user,state,command,time,LEFT(REPLACE(info,'\n',' '),120) AS Info FROM information_schema.processlist WHERE command <> 'Sleep' AND info NOT LIKE '%PROCESSLIST%' ORDER BY TIME DESC LIMIT 100;

