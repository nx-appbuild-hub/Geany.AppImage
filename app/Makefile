# Copyright 2022 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

.PHONY: all

all: clean init
	mkdir --parents $(PWD)/build/Boilerplate.AppDir/
	$(PWD)/bin/Apprepo.AppImage --destination=$(PWD)/build appdir boilerplate \
		geany geany-common geany-plugin-addons geany-plugin-autoclose geany-plugin-automark \
		geany-plugin-codenav geany-plugin-commander geany-plugin-ctags geany-plugin-defineformat \
		geany-plugin-doc geany-plugin-extrasel geany-plugin-gendoc geany-plugin-geniuspaste \
		geany-plugin-git-changebar geany-plugin-gproject geany-plugin-insertnum geany-plugin-keyrecord \
		geany-plugin-latex geany-plugin-lineoperations geany-plugin-lipsum geany-plugin-lua \
		geany-plugin-macro geany-plugin-miniscript geany-plugin-numberedbookmarks geany-plugin-overview \
		geany-plugin-pairtaghighlighter geany-plugin-pg geany-plugin-pohelper \
		geany-plugin-prettyprinter geany-plugin-prj geany-plugin-projectorganizer \
		geany-plugin-sendmail geany-plugin-shiftcolumn geany-plugin-spellcheck \
		geany-plugin-tableconvert geany-plugin-treebrowser geany-plugin-updatechecker \
		geany-plugin-vc geany-plugin-vimode geany-plugin-workbench \
		geany-plugin-xmlsnippets geany-plugins geany-plugins-common

	sed -i -e 's#/usr#./..#g' $(PWD)/build/Boilerplate.AppDir/lib64/libgeany.so
	sed -i -e 's#/usr#./..#g' $(PWD)/build/Boilerplate.AppDir/lib64/libgeany.so.0

	echo '' 										>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '' 										>> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '$${APPDIR}/bin/geany $${@}'               >> $(PWD)/build/Boilerplate.AppDir/AppRun

	rm -f $(PWD)/build/Boilerplate.AppDir/*.desktop 		|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.png 		  	|| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.svg 		  	|| true

	cp --force $(PWD)/AppDir/*.desktop     $(PWD)/build/Boilerplate.AppDir || true
	cp --force $(PWD)/AppDir/*.svg         $(PWD)/build/Boilerplate.AppDir || true
	cp --force $(PWD)/AppDir/*.png         $(PWD)/build/Boilerplate.AppDir || true


	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/Boilerplate.AppDir $(PWD)/Geany.AppImage
	chmod +x $(PWD)/Geany.AppImage

init:
	mkdir --parents $(PWD)/bin

	wget https://apprepo.de/appimage/download/apprepo \
		--output-document=$(PWD)/bin/Apprepo.AppImage
	chmod +x $(PWD)/bin/Apprepo.AppImage

	wget https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage \
		--output-document=$(PWD)/bin/appimagetool.AppImage
	chmod +x $(PWD)/bin/appimagetool.AppImage

clean:
	rm -rf $(PWD)/*.AppImage
	rm -rf $(PWD)/bin/*
	rm -rf $(PWD)/build
