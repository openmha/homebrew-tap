class Openmha < Formula
  OPENMHA_TAG = "v4.18.0"
  desc "Open Master Hearing Aid (openMHA)"
  homepage "http://www.openmha.org/"
  url "https://github.com/Hoertech-gGmbH/openMHA", :using => :git, :tag => OPENMHA_TAG

  license "AGPL-3.0-only"

  depends_on "jack"
  depends_on "qjackctl" => :recommended
  depends_on "libsndfile"
  depends_on "pkgconfig" => :build
  depends_on "portaudio"
  depends_on "liblo"
  depends_on "eigen" => :build
  depends_on "coreutils" => :build # needed for the "realpath" command
  depends_on "labstreaminglayer/tap/lsl"
  depends_on "pytorch"             # One plugin uses libtorch.

  # cmake, boost needed for the unit tests. We execute those during homebrew build.
  depends_on "cmake" => :build
  depends_on "boost" => :build

  # openjdk, octave needed for controlling MHA from Matlab/Octave.
  depends_on "openjdk" => :recommended
  depends_on "octave" => :recommended

  def install
    system "./configure", "--prefix=#{prefix}"
    system "HOMEBREW_OPENMHA_TAG=#{OPENMHA_TAG} make homebrew"
  end
end
