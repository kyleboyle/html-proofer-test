#/bin/bash

if [ ! -n "$WERCKER_HTML_PROOFER_TEST_VERSION" ]; then
    export WERCKER_HTML_PROOFER_TEST_VERSION=">2.1.0"
fi

cd $WERCKER_SOURCE_DIR/$WERCKER_HTML_PROOFER_TEST_BASEDIR

gem install html-proofer:"'$WERCKER_HTML_PROOFER_TEST_VERSION'"

htmlproof --verbose

#export ARGS='{:href_swap => {/http:\/\/baseurl\.com/ => ""} }'
#ruby -e "require 'html/proofer'" -e "HTML::Proofer.new('.', $ARGS).run"
