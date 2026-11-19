# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8d947caf31e4da64967d1926ce1a3f27ee783801fbcba07779d4e1c9749d8075"
    sha256 cellar: :any_skip_relocation, ventura:      "fb2f4d5515e55bf298e3be3e8f9613a4463867520c0cf9257212736f80fb0321"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "a31b9e853318929ac2dbab90b57182b7ae7af4d7a2f572a703f22bb2774b991d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6df20873c63ecd4a37036b799eec2d251c646c2e071153055218a52a3fc1ecd9"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.0/stbox_5.1.0_darwin_arm64.tar.gz"
      sha256 "a146d330245a0482b7f8890a0205a0fbe0ef504b70ca874dc97cb9dd4c1d61da"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.0/stbox_5.1.0_darwin_amd64.tar.gz"
      sha256 "b98688420612b98c7f05ddf5116ea0eb718f616080fdc97432e4e55e6488b698"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.0/stbox_5.1.0_linux_arm64.tar.gz"
      sha256 "0dddca1654de3fd4acf7d1547021025327c8e7e90cbe305be0d9979b51d3e66c"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.0/stbox_5.1.0_linux_amd64.tar.gz"
      sha256 "1f3d1692afdcbf1a04ce07fafb4f0e7fe92ed8a03bbf3216554c37077c8b168b"
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
