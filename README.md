# lokinet builder

<p align="center">
    <a href="https://github.com/loki-project/lokinet-builder/commits/master"><img alt="pipeline status" src="https://gitlab.com/lokiproject/lokinet-builder/badges/master/pipeline.svg" /></a>
</p>

this repo is a recursive repo for building lokinet with all of the required libraries bundled as git submodules

## building the debian package

    $ sudo apt install devscripts build-essential libtool autoconf cmake git libcap-dev wget
    $ git clone --recursive https://github.com/loki-project/lokinet-builder
    $ cd lokinet-builder
    $ debuild -b -us -uc

## cross compile on linux for windows
    
    $ sudo apt install build-essential libtool autoconf cmake git mingw-w64
    $ git clone --recursive https://github.com/loki-project/lokinet-builder
    $ cd lokinet-builder
    $ make windows

# running

Install the debian package, build the debian package manually if you want optimizations compiled in.

if the machine you run lokinet on has a public address (at the moment) it `will` automatically become a relay, 
otherwise it will run in client mode.


**NEVER** run lokinet as root.

to set up a lokinet to start on boot:

    # systemctl enable --now lokinet.service

alternatively:

set up the configs and bootstrap (first time only):

    $ lokinet -g && lokinet-bootstrap
    
run it (foreground):
    
    $ lokinet

to force client mode edit `/var/lib/lokinet/.lokinet/lokinet.ini` or `$HOME/.lokinet/daemon.ini`

comment out the `[bind]` section, so it looks like this:

    ...
    
    # [bind]
    # eth0=1090

