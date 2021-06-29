#
# common include file for all makefiles
#
# install with back up
instm := install -b -S .bak
# install a normal file
inst  := $(instm) -m 644 
# install an executable
instx := $(instm) -m 755
# install a directory
instd := install -d -m 755
# apt without questions being asked
apt := DEBIAN_FRONTEND=noninteractive apt -q -y -o DPkg::Options::=--force-confold
aptinst := $(apt) install
# the directory where this file is in
this_dir := $(dir $(lastword $(MAKEFILE_LIST)))
# utility directory
bin_dir := $(this_dir)../bin
# ensure line
ensure_line := $(bin_dir)/ensure_line
# key-value merge
kv_merge := $(bin_dir)/kv_merge

data_dir := $(this_dir)../../data
hdb := $(data_dir)/hosts.sqlite
udb := $(data_dir)/users.sqlite

ifneq ($(wildcard $(hdb)),)
ip_addr := $(shell $(bin_dir)/get_ip_addr)
hostname := $(shell sqlite3 $(hdb) "select hostname from hosts where ip_addr=\"$(ip_addr)\" and idx = 0 limit 1")
hostnames := $(shell sqlite3 $(hdb) "select hostname from hosts where ip_addr=\"$(ip_addr)\"")
node_id := $(shell sqlite3 $(hdb) "select node_id from hosts where ip_addr=\"$(ip_addr)\" limit 1")
endif
