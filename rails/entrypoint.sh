#!/bin/bash
# 特定のserver.pidファイルが事前に存在する場合にサーバーが再起動しないというRails特有の問題を修正する

set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"