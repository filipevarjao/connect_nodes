newborn
=====

An OTP application

Build
-----

    $ rebar3 compile


Running
-------

```
rebar3 as dev1 do compile, release, run
rebar3 as dev1 do compile, release, shell
```

Status
------

Currently crashing as the supervisor/process stuff needs work, but templating etc, is working correctly.

Testing
=======

Capture filter for 3 node cluster (wireshark) is 

```
tcp port  9890 ||tcp port  9891 ||tcp port  9892 ||tcp port  9893 ||tcp port  9990 ||tcp port  9991 ||tcp port  9992 ||tcp port  9993
```


