#
# db.mk --- make a database of hosts and users
# 
include ../common.mk

OK : $(db)

$(db) : $(data_dir)/hosts.csv $(data_dir)/users.csv
	rm -f $(db)
	echo -n | sqlite3 -separator , -cmd ".import $(data_dir)/hosts.csv hosts" $(db).bak
	echo -n | sqlite3 -separator , -cmd ".import $(data_dir)/users.csv users" $(db).bak
	mv $(db).bak $(db)
