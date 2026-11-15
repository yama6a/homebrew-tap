# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.21.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "868438f369ab8f5103c11bd7c8da854e2a55ba174156b4ebee86b66d9abdba98"
    sha256 cellar: :any_skip_relocation, ventura:      "accc0ed01af3d42d2f66024ff083de774bca1fc8133de9d12f51e60959848b5e"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "e22ddce0440326b3607550c219962e1d9d06f1f47d7b7137d9bc2b4324f70c07"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b8b27d6f33c9e52b084c090eea2cc6edd53337e23657c135d382417d0e175e2e"
  end

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
