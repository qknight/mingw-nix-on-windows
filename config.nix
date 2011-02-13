# http://wiki.nixos.org/wiki/Crash_Course
{
   packageOverrides = pkgs : with pkgs; {
     winmingw = callPackage ./winmingw.nix {};
   };
}
