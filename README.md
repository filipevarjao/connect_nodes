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
