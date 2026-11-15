# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.23.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "18cf1bda47775bec63caea5c93340c1c709f20b080fe6280cc574143a6e97a53"
    sha256 cellar: :any_skip_relocation, ventura:      "4e955b746c0dec2235cf5aa1b76661a0e3afca808334fb466855af8b25a95a5e"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "115924fcf77d4156495eea9aa10d421d72c532731cadac2775734f4c7d858395"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9c7634b7d025c207786cb72782b6b4b379c7d0cfbed28da8082d43c4778bb298"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.23.1/stbox_4.23.1_darwin_arm64.tar.gz"
      sha256 "d79ffa9bd11b09dc055e8f304ad1703979c0b9a8ae37639bc815293782f5d8cd"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.23.1/stbox_4.23.1_darwin_amd64.tar.gz"
      sha256 "220dca2b4ba33088b594d349d5c9e15d88c5a22e53cc8d6a900a156c6866515a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.23.1/stbox_4.23.1_linux_arm64.tar.gz"
      sha256 "2519fd67ba8e674e4651e3783b3f03ee1a7da4a7d220ed40d6dda72f57677b1e"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.23.1/stbox_4.23.1_linux_amd64.tar.gz"
      sha256 "b69263b911b2749ccc50eb0640d5fcae0d0758d9e1a13c7e5e6f8a80b62c3f3a"
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
