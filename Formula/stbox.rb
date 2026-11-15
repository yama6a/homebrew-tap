# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.25.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "dc2e04be3dc4a42ec9f4ffbbec2d16a648f39077714bcae3fe0777fe8ff42655"
    sha256 cellar: :any_skip_relocation, ventura:      "7e79151f9d3c1a1a8789e77df8fd57a482914577c7dff09db2669735963f81cc"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "4869502190a72ec64152fb82b4f404141fc13fa4cf2a9897d6cb00820d17e93c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fffc2b6d4d7b50e084e8903388439c8339b967a399125edf28182a7f7b02e839"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.1/stbox_4.25.1_darwin_arm64.tar.gz"
      sha256 "9e767a7b634928229f5977fe9a238c14b56e38108f1b28b10c3621be4a0d63a3"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.1/stbox_4.25.1_darwin_amd64.tar.gz"
      sha256 "d65c124e2922dcb4deb3fbb6fcb7b7035484c4ac8ea314baa3147314ef20b5f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.1/stbox_4.25.1_linux_arm64.tar.gz"
      sha256 "68085a7cc8c6da2f8c30445c51f02c8ae8847b112cc18aa0f70469dbbccc0ffe"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.1/stbox_4.25.1_linux_amd64.tar.gz"
      sha256 "8e15e3523407155b59b3962f04c899cd402460b663d976464ada2e7049ff1cd5"
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
