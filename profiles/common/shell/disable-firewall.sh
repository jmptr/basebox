service iptables save > $PRV_LOG_OUT 2> $PRV_LOG_ERR
service iptables stop > $PRV_LOG_OUT 2> $PRV_LOG_ERR
chkconfig iptables off > $PRV_LOG_OUT 2> $PRV_LOG_ERR
