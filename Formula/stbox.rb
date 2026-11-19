# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "943fd55d1243ba802cc04a3f092adce5b83da0444f8a56cc1b6eb75bf4c81352"
    sha256 cellar: :any_skip_relocation, ventura:      "dda1930f0231c3f02397caf8c13eb60e0ba9cf20d8d49539bb10ce376bb09f60"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "a810efc53b6316dbf600b543dbe212cef8cd5804c240c41b41733e6a94dac591"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ef8d1bc4b266a91f15aa67ae05cf99ec59bd430027a835a5c009505aa9eca21b"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.1/stbox_5.1.1_darwin_arm64.tar.gz"
      sha256 "f1fb12e0271c70de51ba5a52cfb285996d945f8eaec5af7dcc52b67815ca1d5b"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.1/stbox_5.1.1_darwin_amd64.tar.gz"
      sha256 "5a30e53e6775f917dcc3f3181653df143f526cdf1e316c983bd227019e99c802"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.1/stbox_5.1.1_linux_arm64.tar.gz"
      sha256 "1450be7a98f31afc74a902a4fec227d5b9a7ec5ecd2870a76b3bacef1214f47e"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.1/stbox_5.1.1_linux_amd64.tar.gz"
      sha256 "a72c51829c34dcae73b6e1e43eb883af7172634a569ff455039bc384feccc51f"
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
