# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.25.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4dcc7d23022244c8771065c6f5995c064251e8684664a2197cf1fcea5e935cf7"
    sha256 cellar: :any_skip_relocation, ventura:      "112f2b6e12a334a5fb6eceda963a17b33347f6f322c30f3c912e107d685682a7"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "8a9210faa4874e3ff5d4dac275ebe66f4f944896eba08ae30987826cfd728245"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a79b0ce8b66c18cb5d7e5c51dd487196659d08d36a9230c4fe53dc399fe2c6ba"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.2/stbox_4.25.2_darwin_arm64.tar.gz"
      sha256 "a06dd3538dd4fca059a9f7de2b5e66de4fd6d8c85bc5dc1c53249425f01b9d95"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.2/stbox_4.25.2_darwin_amd64.tar.gz"
      sha256 "b03e4ded9bb087ec23be17e044deae560c03ae97256d6f1b9e2d2f26e20b0c21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.2/stbox_4.25.2_linux_arm64.tar.gz"
      sha256 "54a6598d2185d13225fb3eb645c8b37d7d6d4276ef3cb32ea4a7ffb6149304fd"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.2/stbox_4.25.2_linux_amd64.tar.gz"
      sha256 "d75f099fd9478463c9b771f3abec5daabae9f5593fc1fdccb748226d21103736"
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
