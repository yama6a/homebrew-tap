# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "57c013f1807902b8f719ff33433b4d4c57127452faed873804f999cdf4a280c3"
    sha256 cellar: :any_skip_relocation, ventura:      "04779ebe8d249eb258df4f8309a47492f29af439cb9191923a73ab90598be96d"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "22c15d2c8179a62808e1b5217d02f3e54a89fb30b46d62d3e38917663229c13a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5da88b59b1b77dd18decb08ebfd4beeb5c023dbdc975af62960e3747c0d79213"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.0.0/stbox_5.0.0_darwin_arm64.tar.gz"
      sha256 "baa089f1ea27eb2781f3eeeca532b72e208c3f5e54c17a7c87d5155a01dec700"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.0.0/stbox_5.0.0_darwin_amd64.tar.gz"
      sha256 "aedff89beb7650f1f7d7e80e1f0924561ab1c56b7327972f5e84e84fa55c956a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.0.0/stbox_5.0.0_linux_arm64.tar.gz"
      sha256 "9bc3f6ead9f26146b6c46776848a495ba82dc1c47f6552a61b9559df60d9b505"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.0.0/stbox_5.0.0_linux_amd64.tar.gz"
      sha256 "dc22737b957de3e62185971e88f0534720d56efd2f3a5241f1a07e7a1860d370"
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
