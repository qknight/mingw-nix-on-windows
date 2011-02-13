{stdenv, unzip, fetchurl}:

stdenv.mkDerivation rec {
  name = "winqt-4.7.1";

  src = fetchurl {
    url = "http://lastlog.de/misc/qt-everywhere-opensource-src-4.7.1.zip";
    sha256 = "14c88ccc637f8f93aded12e6e462ea87ec1a33bf8298b9c2b5f440be50e3b206";
  };
  #buildInputs = [ unzip ];

  phases = "unpackPhase configurePhase buildPhase installPhase";
  
  unpackPhase = ''
    ls -la > /tmp/qt_ls_la00000
    mkdir ${name}
    cd ${name}
    ls -la > /tmp/qt_ls_la00001
    unzip -qp "$src"
    ls -la > /tmp/qt_ls_la00002
    cd qt-everywhere-opensource-src-4.7.1/
    ls -la > /tmp/qt_ls_la00003
  '';

  configurePhase = ''
    ls -la > /tmp/qt_ls_la00004
    cd qt-everywhere-opensource-src-4.7.1/
    ls -la > /tmp/qt_ls_la00005
    configure.exe -confirm-license -opensource -release
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    make install
  '';

  meta = {
    description = "MinGW build 2011-02-11";
    homepage = "http://www.mingw.org";
    license = "unknown";
    #maintainers = with stdenv.lib.maintainers; [qknight];
    #platforms = with stdenv.lib.platforms; linux;
  };
}

