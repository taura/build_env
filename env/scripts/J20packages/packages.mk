#
# packages.mk --- install packages
#
include ../common.mk

cond := partial=""

ifeq ($(node_id),0)
cond +=  or master=1
else
cond +=  or clients=1
endif

ifeq ($(node_id),)
desktop := 
else
desktop := $(shell sqlite3 $(hdb) 'select desktop from hosts where node_id=$(node_id)')
endif
ifeq ($(desktop),1)
cond +=  or desktop=1
endif

pkgs := $(shell sqlite3 $(hdb) 'select name from packages where $(cond)')

OK : $(pkgs)

$(pkgs) : % : do_install

do_install :
	$(apt) update
	$(aptinst) $(pkgs)
	$(apt) upgrade
