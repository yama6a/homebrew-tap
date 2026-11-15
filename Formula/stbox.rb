# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.25.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2561db0f53e5be00cf6b3f31738296ef708cb2348174603cff97463a7d8ae009"
    sha256 cellar: :any_skip_relocation, ventura:      "9bcb38e7d8049e514cf7d8ee9a1bfaa91e1e6da3a1ff4a34ff6d3f63a6b70c37"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "510402ca5dcb8acb768fc6bb104577195f8ae9ac23386ce3f3d7adba5b199ea6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8030217f41cc6d11dec36c4c1e2dcaad410b4bc3552912fce529bff4730535ec"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.0/stbox_4.25.0_darwin_arm64.tar.gz"
      sha256 "d60392671b5bb3542315ab2e4e6980fee73b64243465cb6ec1c58d940d17fa43"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.0/stbox_4.25.0_darwin_amd64.tar.gz"
      sha256 "fef0a319dd13cc973a6765ebd95436ef619e2c88013e3ffef7781f77b0471f5b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.0/stbox_4.25.0_linux_arm64.tar.gz"
      sha256 "df7a0f8fc370e9d01978edb187e1dba8d3d64434a6bf1188e4a3c9597ee4d165"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.0/stbox_4.25.0_linux_amd64.tar.gz"
      sha256 "42c234bf57715fdf288f2b9dd9a5180b1887615212c018d0d7477dbaf7456495"
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
