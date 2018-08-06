#!/bin/bash

git config --global url.https://github.com/.insteadOf git://github.com/
git config --global url.https://github.com/.insteadOf git@github.com:

rebar3 eunit 
