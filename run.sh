#/bin/bash

if [ -n "$WERCKER_HTML_PROOFER_TEST_VERSION" ]; then
    export WERCKER_HTML_PROOFER_TEST_VERSION="-v $WERCKER_HTML_PROOFER_TEST_VERSION"
else
    export WERCKER_HTML_PROOFER_TEST_VERSION="-v 2.1.0"
fi

export OLD_GEM_HOME=$GEM_HOME

# install ruby gem
export GEM_HOME=$WERCKER_CACHE_DIR/html-proofer/gems
mkdir -p $GEM_HOME
gem install html-proofer $WERCKER_HTML_PROOFER_TEST_VERSION

eval $GEM_HOME/bin/htmlproof $WERCKER_SOURCE_DIR/$WERCKER_HTML_PROOFER_TEST_BASEDIR $WERCKER_HTML_PROOFER_TEST_ARGUMENTS

#export ARGS='{:href_swap => {/http:\/\/baseurl\.com/ => ""} }'
#ruby -e "require 'html/proofer'" -e "HTML::Proofer.new('.', $ARGS).run"
