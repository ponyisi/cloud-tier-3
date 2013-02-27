#!/bin/bash
#
# Edit customize.sh as you wish to customize squid.conf.
# It will not be overwritten by upgrades.
# See customhelps.awk for information on predefined edit functions.
# In order to test changes to this, run this to regenerate squid.conf:
#       service frontier-squid
# and to reload the changes into a running squid use
#       service frontier-squid reload
# Avoid single quotes in the awk source or you have to protect them from bash.
#

awk --file `dirname $0`/customhelps.awk --source '{
setoption("acl NET_LOCAL src", "127.0.0.1 129.114.0.0/16")
setoption("cache_mem", "128 MB")
setoption("cache_log", "/scratch/squid_logs/cache.log")
setoptionparameter("access_log", 1, "/scratch/squid_logs/access.log")
setoption("coredump_dir", "/data/squid_cache")
setoptionparameter("cache_dir", 2, "/scratch/squid_cache")
setoptionparameter("cache_dir", 3, "100000")
print
}'

