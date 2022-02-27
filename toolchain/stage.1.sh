#!/bin/bash
BROILER_LAST=$(git ls-remote . refs/heads/main | cut -f 1)

echo ${BROILER_LAST}

### EOF
