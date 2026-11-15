# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.21.8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9de56b06565c3784ce44714f1122a13e250c465d95feb80d034dfe7597117bf7"
    sha256 cellar: :any_skip_relocation, ventura:      "771e987d06b6f00db4f48e3e251ab5b9d5e7519663c3a590c5da0e16ff9a0e51"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "d487b2d3e6aaf139b2c009da405c709c3a6b8c06cbb4fffc46e02fe163928ecf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6fbb36cdb58f91ecad67ed5b1a09e482518d5797904b7fee1e3d01820d63d296"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.8/stbox_4.21.8_darwin_arm64.tar.gz"
      sha256 "67ada19a9dd6bf230b5a70a943efbca5ad7e3f2c2656b33f61899acb446e918e"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.8/stbox_4.21.8_darwin_amd64.tar.gz"
      sha256 "e9f3773968f1953e0d272f9c8fa0aace9cbfea4678dd8599eb9a1909f57fd35f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.8/stbox_4.21.8_linux_arm64.tar.gz"
      sha256 "60a533068ed21749ca92015b62ffb110f6782f0824ff91dc73bdfcf50e262997"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.8/stbox_4.21.8_linux_amd64.tar.gz"
      sha256 "3fd03edefada90ebb23e1e8739e8acc4913694f215403c65e20f7bdbd33e54cb"
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
