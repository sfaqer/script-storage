SELECT
t.session_id,
t.elapsed_time_seconds as duration_seconds,
s.[host_name], s.program_name, s.login_name, s.nt_domain, s.nt_user_name,
s.cpu_time, s.memory_usage, s.total_elapsed_time, s.reads, s.writes,
s.logical_reads,s.transaction_isolation_level
FROM sys.dm_tran_active_snapshot_database_transactions t
INNER JOIN sys.dm_exec_sessions s ON t.session_id=s.session_id
WHERE t.elapsed_time_seconds>0
ORDER BY elapsed_time_seconds DESC;