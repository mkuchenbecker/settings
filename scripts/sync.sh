perform_sync() {
    if [ -n "$REPO" ]
    then
        echo "sync: $REPO"
        rsync -avzhe ssh $WORKSPACE/$REPO mkuchenbecker@$MYONEBOX:/code
    else
        echo "REPO env var required for perform_sync"
        exit 1
    fi
}

oneboxsync() {
    if [ -n "$1" ]
    then
        REPO=$1
        perform_sync
        while true; do
        inotifywait -q -r --exclude '\.git,integration-venv,venv' -e modify,attrib,close_write,move,create,delete $WORKSPACE/$REPO
        perform_sync "$REPO"
        done
    else
        echo "repo required for oneboxsync"
        exit 1
    fi
}

syncgencode() {
    rsync -avzhe ssh mkuchenbecker@$MYONEBOX:/code/stashdblib/protoc-gen-stash/tests/generated $WORKSPACE/stashdblib/protoc-gen-stash/tests/
}

sidltar() {
    rsync -avzhe ssh mkuchenbecker@$MYONEBOX:/code/podieintegration/lyft-idl-dev.tar.gz ./lyft-idl-dev.tar.gz
}

sendprotoc() {
    cd $lyft/stashdblib/protoc-gen-stash/ && env GOOS=linux go build -o ./protoc-gen-stash && cd ..
    rsync -avzhe ssh ./protoc-gen-stash/protoc-gen-stash mkuchenbecker@$MYONEBOX:/code/idl/build/bin/
}


genprotocbin() {
    cd $lyft/stashdblib/protoc-gen-stash/ && env GOOS=linux go build -o ../../idl/build/bin/protoc-gen-stash && cd ..
}

