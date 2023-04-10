#!/usr/bin/env bash

mkdir font-out

run_root=0

for f in font-in/*; do
    if [ -d "$f" ]; then
        d=$(basename $f)
        mkdir $(pwd)/font-out/$d
        docker run --rm -v $(pwd)/font-in/$d:/in -v $(pwd)/font-out/$d:/out nerdfonts/patcher \
            --mono --complete --careful --also-windows --no-progressbars \
            --fontawesome --fontawesomeextension --fontlogos --octicons --codicons --powersymbols --pomicons --powerline --powerlineextra --material --weather
    else
        run_root=1
    fi
done

if [ "$run_root" == 1 ]; then
    docker run --rm -v $(pwd)/font-in:/in -v $(pwd)/font-out:/out nerdfonts/patcher \
        --mono --complete --careful --also-windows --no-progressbars \
        --fontawesome --fontawesomeextension --fontlogos --octicons --codicons --powersymbols --pomicons --powerline --powerlineextra --material --weather
fi