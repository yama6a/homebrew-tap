# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.24.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "baa96f25ea06c9a208c7f79f79262af952759e64869b6720bac0de989bc768b9"
    sha256 cellar: :any_skip_relocation, ventura:      "1033c8d9c144f8ad2e843f173422c04dc1afee9533e35909859b18ba850dfbc6"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "acc64d5dce3b0134bd756c282abb9189269bbc562aac758ff539b086c54922a7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1bb1533f2460448dbab4020d4b207363aa2d1f75473efdc29120fbe64614e746"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.0/stbox_4.24.0_darwin_arm64.tar.gz"
      sha256 "05dc061a31db3c76c1cd5bc7fbe084006ca156f8568d516df20b117c9aac1bf1"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.0/stbox_4.24.0_darwin_amd64.tar.gz"
      sha256 "1e1f498da3792be02d5a05c7777bd0257ed079fd155f517dc3921e353e8c4e9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.0/stbox_4.24.0_linux_arm64.tar.gz"
      sha256 "ac8d460a5c1c4581d8e3405d2815af9145b21a15a70c4971eb5384be699d83e7"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.0/stbox_4.24.0_linux_amd64.tar.gz"
      sha256 "a28c056a0681a5b090c7b03de704070c663d9bae3c9b036ba2d9c8fa4500fd81"
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
