#!/bin/bash
onebox_env && control ensure -g stashdblib.dev && control enter stashdblib.legacy && make bootstrap
control ensure -g lyft-idl.dev
control ensure -g runtime.dev

ssh -t $ONEBOX 'onebox_env'
