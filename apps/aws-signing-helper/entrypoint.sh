#!/usr/bin/env bash

if [[ -z "$TRUST_ANCHOR_ARN" ]]; then
  echo "❌ Must provide TRUST_ANCHOR_ARN environment variable." 1>&2
  exit 1
fi

if [[ -z "$PROFILE_ARN" ]]; then
  echo "❌ Must provide PROFILE_ARN environment variable." 1>&2
  exit 1
fi

if [[ -z "$ROLE_ARN" ]]; then
  echo "❌ Must provide ROLE_ARN environment variable." 1>&2
  exit 1
fi

echo "🚀 Starting IMDSv2 endpoint with aws_signing_helper ..."

exec \
    /app/bin/aws-signing-helper serve \
      --certificate /iamra/tls.crt         \
      --private-key /iamra/tls.key         \
      --trust-anchor-arn $TRUST_ANCHOR_ARN \
      --profile-arn $PROFILE_ARN           \
      --role-arn $ROLE_ARN
