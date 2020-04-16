SOURCE="https://pencil.evolus.vn/dl/V3.1.0.ga/pencil_3.1.0.ga_amd64.deb"
DESTINATION="build.deb"
OUTPUT="Pencil.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION)  $(SOURCE)
	
	dpkg -x $(DESTINATION) build
	rm -rf AppDir/opt
	
	mkdir --parents AppDir/opt/application
	mv build/opt/pencil-3.1.0.ga/* AppDir/opt/application

	chmod +x AppDir/AppRun

	appimagetool AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf build
