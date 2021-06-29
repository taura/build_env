# J20packages

```
make -f packages.mk
```

* installs a whole bunch of apt packages

* for things you can install just with apt, just add your packages to `../../../data/packages.csv`
* in that file, if you leave the `partial` column empty, that package will be insalled on all hosts, so to add a package to all nodes, just add a line only with a package name
* if `partial` column is set to 1, then remaining columns determine which hosts install the package
  * if `master` is set to 1, it is installed on the master host (node_id=0 in the `hosts` table)
  * if `clients` is set to 1, it is installed on all hosts except the master host (node_id<>0 in the `hosts` table)
  * if `desktop` is set to 1, it is installed on hosts that have `desktop` column set to 1 in the `hosts` table
* you can add any column to this table and fine tune which packages are installed on which hosts. e.g., add `hogehoge` column and set it to 1 on packages P, Q, R, ...; add the same column `hogehoge` to the hosts table too and set it to 1 on hosts H, I, J, ... then P, Q, R, ... will be installed on H, I, J, ...


