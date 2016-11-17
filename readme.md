Converter
=========

Build
`docker build --tag="wiki-converter" .`

Convert
`docker run -it --rm -v $(pwd)/input-file-name.xml:/opt/input.xml -v $(pwd)/output:/opt/output wiki-converter`

Exchange input-file-name.xml in convert-command with your file name or rename your input file. Should be located in this directory.

Optional: Delete image afterwards with `docker rmi wiki-converter`

Sources
-------

https://github.com/philipashlock/mediawiki-to-markdown
https://github.com/jagregory/pandoc-docker/blob/master/Dockerfile
