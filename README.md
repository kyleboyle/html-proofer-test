# Wercker Step html-proofer-test

This step will download the specified version of [html-proofer](https://github.com/gjtorikian/html-proofer) ruby gem and run its checks against the specified directory.

# Parameters

## version (optional/recommended)

Specifies the version of html-proofer to be used, by default this is `2.1.0`. 

## basedir (optional)

Specifies the base directory in which to run the tests. For example, if you have static content being generated to the `_site` directory, specify `_site` here.

## arguments (optional)

Specifies arguments of html-proofer. By default this is `--verbose`.

# Example wercker.yml

```yml
box: wercker/ruby
build:
  steps:
    - kyleboyle/html-proofer-test:
        version: "2.1.0"
        basedir: public
        arguments: --verbose
```

#TODO
- [x] Expose html-proofer arguments
- [ ] support links/src with baked in base url see [PR](https://github.com/gjtorikian/html-proofer/pull/178)