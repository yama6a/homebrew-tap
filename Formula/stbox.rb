# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.11"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b0f7dd571d400fce2fc5691c033a88270705aaaee55f0073e4cffc110ee2ba8f"
    sha256 cellar: :any_skip_relocation, ventura:      "7ba92eef560b6755e44ed292ffce64e36b502422775e20f6729c2382768741bd"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "53427dc2aaefa71fa51e442414ee1deb307b3b1f655e2ff0239ac59633f6957c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b3784c74519a1741eb8289f1c92c7263ef32c2925ec134e3e283eff7a992a2dd"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.11/stbox_5.1.11_darwin_arm64.tar.gz"
      sha256 "8d374169eafc51df7beaf48023e6d12ee5db07effec435c0507f49363db181b1"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.11/stbox_5.1.11_darwin_amd64.tar.gz"
      sha256 "eb7039116bccff2a728cb627e71224303e59da8ab290ac95f58eb64f08e6deca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.11/stbox_5.1.11_linux_arm64.tar.gz"
      sha256 "096369669185c0399cba696fdb932dfaf1453a3f39cf81bb148d043dd9ee2c73"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.11/stbox_5.1.11_linux_amd64.tar.gz"
      sha256 "0c1ed29dd48d806514035f559f5df19b762bba7928f32869d1b0c8d0a23f1a94"
    end
  end

  def install
    bin.install "stbox"
    prefix.install "THIRD_PARTY_NOTICES.md"
  end

  def caveats
    <<~TEXT
      stbox reads cue images with its built-in glyph OCR engine.
      To use the Tesseract engine instead, install Tesseract too:
        brew install tesseract
    TEXT
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/stbox --version").strip
  end
end
