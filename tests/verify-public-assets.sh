#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PRIVACY="$ROOT/privacy/index.html"
APP_ADS="$ROOT/app-ads.txt"

test -f "$PRIVACY"
grep -q '<title>AtoBee Privacy Policy</title>' "$PRIVACY"
grep -q '<meta name="robots" content="noindex, nofollow">' "$PRIVACY"
grep -q 'contact@atobee.app' "$PRIVACY"
grep -q 'Google Mobile Ads' "$PRIVACY"
grep -q 'Your privacy rights' "$PRIVACY"
grep -q 'Vos droits' "$PRIVACY"
grep -q 'Last updated: 2 August 2026' "$PRIVACY"

test "$(cat "$APP_ADS")" = 'google.com, pub-5909751593491464, DIRECT, f08c47fec0942fa0'

echo "Public privacy and AdMob assets are valid."
