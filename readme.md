Converter
=========

Convert Mediawiki exported xml files to e.g. Markdown. Export e.g. with `php dumpBackup.php --current > input-file-name.xml`

Usage
-----

Build
`docker build --tag="wiki-converter" .`

Convert
`docker run -it --rm -v $(pwd)/input-file-name.xml:/opt/input.xml -v $(pwd)/output:/opt/output wiki-converter`

Exchange input-file-name.xml in convert-command with your file name or rename your input file. Should be located in this directory.

Optional: Delete image afterwards with `docker rmi wiki-converter`

Advanced
--------

Use your own arguments (see readme in mediawiki-to-markdown-master directory) after the convert command above. Example:

`docker run -it --rm -v $(pwd)/input-file-name.xml:/opt/input.xml -v $(pwd)/output:/opt/output wiki-converter php convert.php --filename=/opt/input.xml --output=/opt/output --format=markdown`

Be careful: The paths are from inside the container - filename and output should not be changed. Changing the format option might be the easiest way, to adjust output. 


Modified Markdown-Links
-----------------------

To get links in the output Markdown files directly to the other .md-files, uncomment line 96 in [convert.php](https://git.uni-project.de/updev/converter-mediawiki-markdown/blob/master/mediawiki-to-markdown-master/convert.php#L96) (`$text = str_replace(' "wikilink")', '.md "wikilink")', $text);`). Without this "Trick" your links will be without the .md file-extention.


Converter-Source
----------------

https://github.com/philipashlock/mediawiki-to-markdown
