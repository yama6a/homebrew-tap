# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "681af57d1681635f2ab1b14f906d60af83b97b0ce9224f253c287e9ba6b358b8"
    sha256 cellar: :any_skip_relocation, ventura:      "9447663311c75ef6c5871945ef476c0c59ddcea546962bffa03c86ac51a9bab5"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "b1d45d6ba010db0ca82f148ade2148cff4c733d273476af6fead95ab0c1d56af"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5709e93973d71aa69253111557a09b43a07cd15925eb30c5d4e3643930c0a407"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.4/stbox_5.1.4_darwin_arm64.tar.gz"
      sha256 "6f98dd0b4ecbba5c1dcf43404fbc2507049608a18e684e4561de9f05b4e753ec"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.4/stbox_5.1.4_darwin_amd64.tar.gz"
      sha256 "89934a7af44c3ed2c2c980796d45c4ba75ba4438e8392d662a7a727827634bbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.4/stbox_5.1.4_linux_arm64.tar.gz"
      sha256 "0bc481cd9ca33873e672b84ef094c75947dc74ce9cb31e1e802beb19c61f01b3"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.4/stbox_5.1.4_linux_amd64.tar.gz"
      sha256 "04cd05e0c7434530b2bec80e03eb1ebfbaf2be6eb71828ab21524710fdbdfec3"
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
