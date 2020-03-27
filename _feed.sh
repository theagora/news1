#!/bin/bash

git pull

ruby -r rubygems -e 'require "jekyll-import"; JekyllImport::Importers::RSSRTHK.run({"source"=>"http://rthk9.rthk.hk/rthk/news/rss/c_expressnews_clocal.xml"})'
ruby -r rubygems -e 'require "jekyll-import"; JekyllImport::Importers::RSSRTHK.run({"source"=>"http://rthk9.rthk.hk/rthk/news/rss/c_expressnews_greaterchina.xml"})'
ruby -r rubygems -e 'require "jekyll-import"; JekyllImport::Importers::RSSRTHK.run({"source"=>"http://rthk9.rthk.hk/rthk/news/rss/c_expressnews_cinternational.xml"})'
ruby -r rubygems -e 'require "jekyll-import"; JekyllImport::Importers::RSSRTHK.run({"source"=>"http://rthk9.rthk.hk/rthk/news/rss/c_expressnews_cfinance.xml"})'

ruby -r rubygems -e 'require "jekyll-import"; JekyllImport::Importers::RSSASAHI.run({"source"=>"https://feedx.net/rss/asahi.xml"})'
ruby -r rubygems -e 'require "jekyll-import"; JekyllImport::Importers::RSSBBC.run({"source"=>"https://feedx.net/rss/bbc.xml"})'
ruby -r rubygems -e 'require "jekyll-import"; JekyllImport::Importers::RSSDW.run({"source"=>"https://feedx.net/rss/dw.xml"})'
ruby -r rubygems -e 'require "jekyll-import"; JekyllImport::Importers::RSSREUTERS.run({"source"=>"https://feedx.net/rss/reuters.xml"})'

if [ "$(uname -s)" == "Darwin" ]; then
    archstamp=`date -j -v-7d "+%Y-%m-%d"`
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    archstamp=`date --date="-7 days" +%Y-%m-%d`
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    archstamp=`date --date="-7 days" +%Y-%m-%d`
fi

timestamp=`date "+%Y-%m-%d %H:%M"`

mv _posts/$archstamp* _posts/_archive/.

git add _posts/.
git commit _posts/. -m "Update $timestamp"
git push
