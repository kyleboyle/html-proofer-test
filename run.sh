#/bin/bash

if [ -n "$WERCKER_HTML_PROOFER_TEST_VERSION" ]; then
    export WERCKER_HTML_PROOFER_TEST_VERSION="-v $WERCKER_HTML_PROOFER_TEST_VERSION"
else
    export WERCKER_HTML_PROOFER_TEST_VERSION="-v 2.1.0"
fi

export OLD_GEM_HOME=$GEM_HOME

# install ruby gem
mkdir $WERCKER_STEP_ROOT/gems
export GEM_HOME=$WERCKER_STEP_ROOT/gems
gem install html-proofer $WERCKER_HTML_PROOFER_TEST_VERSION


cd $WERCKER_SOURCE_DIR/$WERCKER_HTML_PROOFER_TEST_BASEDIR

$WERCKER_STEP_ROOT/gems/bin/htmlproof --verbose

#export ARGS='{:href_swap => {/http:\/\/baseurl\.com/ => ""} }'
#ruby -e "require 'html/proofer'" -e "HTML::Proofer.new('.', $ARGS).run"
