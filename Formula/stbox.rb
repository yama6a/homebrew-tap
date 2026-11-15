# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.21.9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f5b08ba55f37f30f44ba1d2d3227e09964ef8f844fa554e8df8b412c0506e01f"
    sha256 cellar: :any_skip_relocation, ventura:      "f8cc7aae5c53e52a6fa6747dbc517452c858036c014b612ef34c9949337f308c"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "7be6baf7f698db86ceea8266e446a0022b091b22d64db38a52200cd6e4c05de4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "97cad8779a20b999ec82354bcbba35fe96cd30f3dd5531a0bdeca4071a60063a"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.9/stbox_4.21.9_darwin_arm64.tar.gz"
      sha256 "93e944668f12cf04073ee2c11789c072089bad559ceb89e41eeb83803371211c"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.9/stbox_4.21.9_darwin_amd64.tar.gz"
      sha256 "b985a0dbe240d47566f72e88256d859e9c27b6884a31e7b129d2c21b8134ad1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.9/stbox_4.21.9_linux_arm64.tar.gz"
      sha256 "fc9eeb84b6453dcc5d7c1cdd606163d50d1e097f17f8bc20d0984228f66e008b"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.9/stbox_4.21.9_linux_amd64.tar.gz"
      sha256 "e82e7073eb0f7f01bde61666a54114832790e8d6930e95131f034a93dddc710f"
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
