# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.7/stbox_4.21.7_darwin_arm64.tar.gz"
      sha256 "bfe6b3b60ef145624a64c75dcb8910de97e2cbc71ac575403bd39e1cc0e05823"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.7/stbox_4.21.7_darwin_amd64.tar.gz"
      sha256 "2b2ac5e29405726c21b29c7adb4091605df5567fc0022781e66bb8039437e5d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.7/stbox_4.21.7_linux_arm64.tar.gz"
      sha256 "f91cfc592adcbc42025b87618e0a58fe6b9b06b89ec84c0294e5bb43f60942c4"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.7/stbox_4.21.7_linux_amd64.tar.gz"
      sha256 "25a4460294dd215cbdd0226474296652da7d34d6b26fe66cebe54effc49bf33f"
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
