SELECT
	transactions.session_id,
	transactions.elapsed_time_seconds as duration_seconds,
	sessions.[host_name], 
	sessions.program_name,
	sessions.login_name, 
	sessions.nt_domain, 
	sessions.nt_user_name,
	sessions.cpu_time, 
	sessions.memory_usage,
	sessions.total_elapsed_time, 
	sessions.reads, 
	sessions.writes,
	sessions.logical_reads,
	sessions.transaction_isolation_level
FROM sys.dm_tran_active_snapshot_database_transactions transactions
	INNER JOIN sys.dm_exec_sessions sessions 
	ON transactions.session_id=s.session_id

WHERE transactions.elapsed_time_seconds > 0

ORDER BY elapsed_time_seconds DESC;