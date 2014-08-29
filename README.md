ib-tws-installer
================

Allows you to download and either install or update Interactive Brokers Trading Workstation on a Linux distribution. Should be much more convenient than what they tell you to do.

Usage
-----
**Install:**

```bash
sudo ./installer.sh
```

**Update:**

The installer.sh script is idempotent. Repeated runs will results in the same outcome. Running it again will reinstall or update the existing installation, depending on whether a new version is available.

```bash
sudo ./installer.sh
```

**Start IB TWS:**

The script installs a desktop file, look for `ib-tws`. Or just run the `ib-tws` command, it is in `$PATH`.

**Uninstall:**

```bash
sudo ./uninstall.sh
```

(This will not remove settings and other data that ib-tws has stored locally in your home folder!)

License
-------

The script and all files in this repository are MIT licensed. However the IB Trading Workstation application is NOT! This script merely downloads it, it is not included in the repository.

**I am not affiliated with Interactive Brokers. They have not sanctioned this script. They most probably don't even know about it.**
