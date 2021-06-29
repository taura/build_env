# build_env

This is a git repo to configure multiple VM instances of mdx

## for impatients ...

1. run several VM instances and obtain their addresses
1. ssh to one of them
1. git clone this repo, under /tmp
```
cd /tmp
git clone https://github.com/taura/build_env.git
```
4. configure hosts and users
```
cd build_env/data
cp hosts.csv.template hosts.csv
cp users.csv.template users.csv
```
and edit hosts.csv and users.csv as you need them. At minimum, you need to list IP addresses of the host.  See below for more details
5. GO!
```
cd /tmp/build_env
sudo apt install make sqlite3 # I wish them to be included in the template
make -f go.mk -j 10
```
The command `make -f go.mk` will first configure the VM you are in and then all other machines conucurrently.
