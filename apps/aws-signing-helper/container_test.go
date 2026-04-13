package main

import (
	"context"
	"testing"

	"github.com/home-operations/containers/testhelpers"
)

func Test(t *testing.T) {
	ctx := context.Background()
	image := testhelpers.GetTestImage("ghcr.io/denniseffing/aws-signing-helper:rolling")
	testhelpers.TestFileExists(t, ctx, image, "/app/bin/aws-signing-helper", nil)
}
