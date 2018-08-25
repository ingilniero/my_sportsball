#!/bin/bash
trap "exit" ERR

APP_NAME="sportsballs-cbra-app"

echo "----> Deploying to Heroku"
./prepare_deploy_directory.sh

VERSION=`git rev-parse HEAD | perl -pe "chomp"`
echo "----> Deploying application version $VERSION"

echo "      Creating build tarball...."
DEPLOY_FILENAME="deploy-$VERSION.tgz"
pushd deploy
tar -czf ../$DEPLOY_FILENAME .
popd

echo "      Requesting application specific source endpoint..."

ACCEPT_HEADER="Accept: application/vnd.heroku+json; version=3.streaming-build-output"
CONTENT_HEADER="Content-Type: application/json"
HEROKU_APP_ENPOINT="https://api.heroku.com/apps/$APP_NAME"

SOURCE_ENDPOINT="$(curl -s -n -X POST "$HEROKU_APP_ENPOINT/sources" -H "$ACCEPT_HEADER")"

PUT_URL=`echo $SOURCE_ENDPOINT | jsawk "return this.source_blob.put_url"`
echo "      Received blob endpoint: $PUT_URL"
GET_URL=`echo $SOURCE_ENDPOINT | jsawk "return this.source_blob.get_url"`
echo "      Received deploy endpoint: $GET_URL"

echo "      Upload app blob"
curl -s "$PUT_URL" -X PUT -H "Content-Type:" \
    --data-binary @$DEPLOY_FILENAME

echo "      Deploy application"

DEPLOY_RESULT="$(curl -n -X POST "https://api.heroku.com/apps/$APP_NAME/builds" \
  -d "{\"source_blob\":{\"url\":\"$GET_URL\",\"version\": \"$VERSION\"}}" -H "$ACCEPT_HEADER" -H "$CONTENT_HEADER")"

build_output_url=`echo "$DEPLOY_RESULT" | jsawk "return this.output_stream_url"`
echo "     Received output endpoint: $build_output_url"

curl "$build_output_url"
