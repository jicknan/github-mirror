# Github Mirror

mirror some github repos for local using for speeding up in China.

update every 4 hours by crontab:

    $ sudo  crontab -e
    0 0-23/4 * * * /usr/local/sbin/github-mirror.sh >> /var/log/github-mirror.log 2>&1


serve using git-daemon:

    sudo yum install -y git git-daemon
    sudo systemctl start git.socket

using:

    git clone git://host/[username]/[repo].git
    git remote set-url --push origin https://github.com/[username]/[repo].git

TODO:
* git-daemon is not stable
