SOURCE="https://dl.bintray.com/probono/AppImages/Geany-1.27.glibc2.15-x86_64.AppImage"
OUTPUT="Geany.AppImage"

all:
	echo "Building: $(OUTPUT)"
	rm -f ./$(OUTPUT)
	wget --output-document=$(OUTPUT) --continue $(SOURCE)
	chmod +x $(OUTPUT)

