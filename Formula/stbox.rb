# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "844be5002d87ecdd53d4e51125c3d40d4fc0cb2ea66963a0cf4f7d85ef575447"
    sha256 cellar: :any_skip_relocation, ventura:      "62b51e18c16c626905325d96341d345253e29e3bd3117764307026bd1e9b6e15"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "0681e981096f1ad01fa13bbbaad05122353392ab68f527ba2dfe51fab08b6a8b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "584bf0d60ea67df79717e933b9b4d31a1c5b3a830f2ede7f011059cfb418c3fa"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.6/stbox_5.1.6_darwin_arm64.tar.gz"
      sha256 "0ca74b044250b08ee0bf3ec2c15f249f487406323f4fdb01e1883fd60c6f0b5e"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.6/stbox_5.1.6_darwin_amd64.tar.gz"
      sha256 "1e46a321b09ffd96009f8cda0a4d944ac22dc524f37de7313850e31ad88dca4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.6/stbox_5.1.6_linux_arm64.tar.gz"
      sha256 "430cb0c470a124659d872bc04a6c60c42ed98b40817590eda1bd7d3efeefd3da"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.6/stbox_5.1.6_linux_amd64.tar.gz"
      sha256 "8704ca4bed7e8391aecfb5280b89c9e2bf8de45ce8d3fba87f2140e87d001058"
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
