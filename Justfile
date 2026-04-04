# all my homies hate juke build

# why do we do this
YARN := invocation_directory() + '/tgui/.yarn/releases/yarn-4.5.1.cjs'

NODE := require("node")

default: build

yarn-tgui:
	cd tgui; {{NODE}} {{YARN}} install

tgui: yarn-tgui
	cd tgui; {{NODE}} {{YARN}} tgui:build

dm:
	DreamMaker -DCBT tgstation.dme

server:
	DreamDaemon tgstation.dmb 1337 -close -trusted -verbose -params -log-directory=ci

build: tgui dm

run: tgui dm server

clean:
	rm -rf tgui/public/.tmp
	rm -f tgui/public/*.map
	rm -f tgui/public/*.{chunk,bundle,hot-update}.*
	rm -rf tgui/packages/tgfont/dist
	rm -f tgui/.yarn/build-state.yml
	rm -f tgui/.yarn/install-target
	rm -f tgui/.pnp.*

	cd tgui; {{NODE}} {{YARN}} clean --all

	rm -f *.{dmb,rsc}
	rm -f _maps/templates.dm

