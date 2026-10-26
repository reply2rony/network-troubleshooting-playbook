#!/bin/bash
# Network quick check — SAMPLE script.
# Usage: ./check-network.sh [gateway] [host-to-test] [port]
# Defaults use public test addresses. Replace them with your own test hosts.
# This script only sends pings and a port test. It does not change settings.

GATEWAY="${1:-192.168.1.1}"
HOST="${2:-example.com}"
PORT="${3:-80}"

echo "=== Network quick check ==="
echo "Gateway: $GATEWAY | Host: $HOST | Port: $PORT"
echo

echo "1. Ping gateway (local network):"
if ping -c 3 -W 2 "$GATEWAY" > /dev/null 2>&1; then
  echo "   OK — gateway replies."
else
  echo "   FAIL — gateway does not reply. Check cable/Wi-Fi and the router first."
fi
echo

echo "2. Ping a public address by number (tests the internet link, not DNS):"
if ping -c 3 -W 2 8.8.8.8 > /dev/null 2>&1; then
  echo "   OK — internet link replies."
else
  echo "   FAIL — internet link does not reply. Check the router and the link."
fi
echo

echo "3. Resolve a name (tests DNS):"
if getent hosts "$HOST" > /dev/null 2>&1; then
  echo "   OK — $HOST resolves to an address."
else
  echo "   FAIL — DNS does not resolve $HOST. Check DNS settings."
fi
echo

echo "4. Test port $PORT on $HOST:"
if (echo > /dev/tcp/"$HOST"/"$PORT") > /dev/null 2>&1; then
  echo "   OK — port $PORT is open on $HOST."
else
  echo "   FAIL or BLOCKED — port $PORT did not answer on $HOST."
fi
