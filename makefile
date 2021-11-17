print: 

dep-os:
	brew install libav
	# dependencies for libav: faac, fdk-aac, lame, libvpx, opus, sdl, theora, x264 and xvid
dep-os-delete:
	brew uninstall libav

test:
	cd $(SRC_FSPATH) && go test ./...

mod:
	cd $(SRC_FSPATH) && go mod tidy

## BIN

BIN_ROOT_FSPATH=$(PWD)/bin

BIN_PLAYER_NAME=$(SRC_NAME)-player
BIN_PLAYER_FSPATH=$(BIN_ROOT_FSPATH)/player
BIN_PLAYER=$(BIN_PLAYER_FSPATH)/$(BIN_PLAYER_NAME)

BIN_ANAL_NAME=$(SRC_NAME)-anal
BIN_ANAL_FSPATH=$(BIN_ROOT_FSPATH)/anal
BIN_ANAL=$(BIN_ANAL_FSPATH)/$(BIN_ANAL_NAME)


bin-player:
	# need libavcodec/avcodec.h
	cd $(SRC_FSPATH)/examples/player && go build -o $(BIN_PLAYER) .
run-player:
	cd $(BIN_PLAYER_FSPATH) && ./$(BIN_PLAYER_NAME)

bin-anal:
	# need libavcodec/avcodec.h
	cd $(SRC_FSPATH)/examples/analyze && go build -o $(BIN_ANAL) .
run-anal:
	cd $(BIN_ANAL_FSPATH) && ./$(BIN_ANAL_NAME)





	
