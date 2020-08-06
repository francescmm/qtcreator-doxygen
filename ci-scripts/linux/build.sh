wget -O qt5.zip https://github.com/francescmm/ci-utils/releases/download/qt/qt5.zip;
unzip -qq qt5.zip;
wget -O qtcreator-src.zip https://github.com/francescmm/ci-utils/releases/download/qt/qt-creator-opensource-src-${QTC_VERSION}.0.zip;
unzip -qq qtcreator-src.zip
wget -O qtcreator-bin.zip https://github.com/francescmm/ci-utils/releases/download/qt/qt-creator-bin-linux.zip;
unzip -qq qtcreator-bin.zip
export QTDIR=$PWD/qt5
export QT_CREATOR=$PWD/Tools/QtCreator/bin
export PATH=$QTDIR/bin:$QT_CREATOR:$PATH;
export QT_PLUGIN_PATH=$PWD/qt5/plugins;
export PLUGIN_VERSION="1.0.1";
$QTDIR/bin/qmake QTC_SOURCE=./qt-creator-opensource-src-${QTC_VERSION}.0 QTC_BUILD=./Tools/QtCreator doxygen.pro
make -j 4
cp $PWD/Tools/QtCreator/lib/qtcreator/plugins/libDoxygen.so libDoxygen$PLUGIN_VERSION-qtc${QTC_COMPAT}.x.so
