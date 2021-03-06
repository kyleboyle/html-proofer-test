#/bin/bash

# check if Ruby is installed
hash ruby 2>/dev/null || { echo "Ruby is required, but not installed. Aborting..." >&2; exit 1; }

if hash htmlproof 2>/dev/null; then

    echo "htmlproof already installed"
    export HTML_PROOF_COMMAND="htmlproof"

else

    ruby_version=`ruby -v`
    echo "Found $ruby_version"
    
    #apt-get install -y ruby-dev
    #yum install -y ruby-dev

    # set correct gems argument for no documentation
    if [[ "$ruby_version" =~ "ruby 1" ]]; then
        no_doc="--no-rdoc --no-ri"
    else
        no_doc="-N"
    fi
    
    if [ -n "$WERCKER_HTML_PROOFER_TEST_VERSION" ]; then
        export WERCKER_HTML_PROOFER_TEST_VERSION="-v $WERCKER_HTML_PROOFER_TEST_VERSION"
    else
        export WERCKER_HTML_PROOFER_TEST_VERSION="-v 2.3.0"
    fi
    
    export OLD_GEM_HOME=$GEM_HOME
    export NOKOGIRI_USE_SYSTEM_LIBRARIES=true
    # install ruby gem
    export GEM_HOME=$WERCKER_CACHE_DIR/html-proofer/gems
    mkdir -p $GEM_HOME
    gem install html-proofer $WERCKER_HTML_PROOFER_TEST_VERSION $no_doc
    
    export HTML_PROOF_COMMAND=$GEM_HOME/bin/htmlproof
fi

eval $HTML_PROOF_COMMAND $WERCKER_SOURCE_DIR/$WERCKER_HTML_PROOFER_TEST_BASEDIR $WERCKER_HTML_PROOFER_TEST_ARGUMENTS

#export ARGS='{:href_swap => {/http:\/\/baseurl\.com/ => ""} }'
#ruby -e "require 'html/proofer'" -e "HTML::Proofer.new('.', $ARGS).run"
