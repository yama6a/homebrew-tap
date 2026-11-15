# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  version "4.21.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.5/stbox_4.21.5_darwin_arm64.tar.gz"
      sha256 "bedd2bc2ca9e4a078c06a0fd3c0222f9b53ef633ef447487ae89c5ebc3d68c60"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.5/stbox_4.21.5_darwin_amd64.tar.gz"
      sha256 "8d9b4c59625ac0d06bc859ea03d8a825466a7e86f318dbfbb5b231b97d2a00e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.5/stbox_4.21.5_linux_arm64.tar.gz"
      sha256 "370c05f28859c1f527c65618a99536503cee6657e7f2d1ec57e02f8d6e159d27"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.5/stbox_4.21.5_linux_amd64.tar.gz"
      sha256 "3f1957859e516d69487945eddb45615636a80ae1fa67555cf20bc77841acc8fd"
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
