#!/usr/bin/env bash

# Usage: ./updown.sh <up/down> <context>


JOB=$1
CLUSTER="${2:-main}"
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ "$JOB" == "up" ]]; then
    while IFS= read -r line; do
        name=$(echo "$line" | jq -r '.name')
        namespace=$(echo "$line" | jq -r '.namespace')
        type=$(echo "$line" | jq -r '.type')
        replicas=$(echo "$line" | jq -r '.replicas')

        # Print the commands to scale up and resume
        echo "kubectl --context ${CLUSTER} -n ${namespace} scale ${type} ${name} --replicas=${replicas}"
        kubectl --context ${CLUSTER} -n ${namespace} scale ${type} ${name} --replicas=${replicas}
        echo "flux --context ${CLUSTER} resume helmrelease ${name} -n ${namespace}"
        flux --context ${CLUSTER} resume helmrelease ${name} -n ${namespace}

    done < <(jq -c '.apps[]' $SCRIPTDIR/apps.json)

elif [[ "$JOB" == "down" ]]; then
    while IFS= read -r line; do
        name=$(echo "$line" | jq -r '.name')
        namespace=$(echo "$line" | jq -r '.namespace')
        type=$(echo "$line" | jq -r '.type')

        # Print the desired commands
        echo "kubectl --context ${CLUSTER} -n ${namespace} scale ${type} ${name} --replicas=0"
        kubectl --context ${CLUSTER} -n ${namespace} scale ${type} ${name} --replicas=0
        echo "flux --context ${CLUSTER} suspend helmrelease ${name} -n ${namespace}"
        flux --context ${CLUSTER} suspend helmrelease ${name} -n ${namespace}

    done < <(jq -c '.apps[]' $SCRIPTDIR/apps.json)
fi

