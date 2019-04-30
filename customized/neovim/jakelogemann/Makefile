
build result:
	nix-build ./default.nix

.PHONY: clean
clean:
	rm ./result

.PHONY: run
run:
	./result/bin/nvim

.PHONY: store-path
store-path:
	./result/bin/nvim-nixStorePath

.PHONY: install
install:
	nix-env -i -f ./default.nix

.PHONY: uninstall
uninstall:
	nix-env -e -f ./default.nix

.PHONY: upgrade
upgrade:
	nix-env -u -f ./default.nix

.PHONY: shell
shell:
	nix-shell
