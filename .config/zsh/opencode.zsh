if [ -n "$DATABASE_URL" ]; then
  export OPENCODE_CONFIG_CONTENT='{"mcp":{"dbhub":{"enabled":true}}}'
fi
