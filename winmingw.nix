{stdenv, fetchurl}:
# example used: misc/drivers/gutenprint/bin.nix
#assert stdenv.system == "x86_64-cygwin";

stdenv.mkDerivation rec {
  name = "winmingw-4.5.0";

  src = fetchurl {
    url = "http://lastlog.de/misc/MinGW-2011-02-11.tar.bz2";
    sha256 = "3ac5ed619870ab6173bd54ab2b4f31fba55e19457e7409c824f987b7513c88bf";
  };

  phases = "installPhase";

  installPhase = ''
    tar -jxf $src 
    cd MinGW-2011-02-11/
    rm -Rf unins*
    mkdir -p "$out"
    cp -r * "$out"
  '';

  meta = {
    description = "MinGW build 2011-02-11";
    homepage = "http://www.mingw.org";
    license = "unknown";
    #maintainers = with stdenv.lib.maintainers; [qknight];
    #platforms = with stdenv.lib.platforms; linux;
  };
}

