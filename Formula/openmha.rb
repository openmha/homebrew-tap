class Openmha < Formula
  desc "Open Master Hearing Aid (openMHA)"
  homepage "http://www.openmha.org/"
  url "https://github.com/tobiasherzke/openMHA", :using => :git, :tag => "v4.17.0.10"
  
  license "AGPL-3.0-only"

  depends_on "cmake" => :test
  depends_on "jack" => :build
  depends_on "libsndfile" => :build
  depends_on "pkgconfig" => :build
  depends_on "portaudio" => :build
  depends_on "openjdk" => :test
  depends_on "octave" => :test
  depends_on "liblo" => :build
  depends_on "eigen" => :build
  depends_on "labstreaminglayer/tap/lsl" => :build
  depends_on "pytorch" => :build # Some plugins use libtorch.

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  test do
    system "make test unit-tests"
  end
end
