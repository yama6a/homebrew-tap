# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.22.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "249b1cfce090d8f856be9c86340ed9a8b30ff82704b6aaba15397bcc45ac6a5f"
    sha256 cellar: :any_skip_relocation, ventura:      "33fe84d65dfc278398f623bc1e81ab542dd57446c20bb63a0a384f12443e625c"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "5fc92b60f49fb899cb8f359fe2f1991ba8189b4f2816eb485d137821451a83bc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "960b42adc13f866ba3945718a3086fdce7f03e727691a6c29d16972a71b3b41d"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.0/stbox_4.22.0_darwin_arm64.tar.gz"
      sha256 "fa55c75681a0c31a3afac559d47540da9769ae35a6b749128e0e72e4ae10995b"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.0/stbox_4.22.0_darwin_amd64.tar.gz"
      sha256 "0a528bc1c21333c1db4c27df8b8da41fcb2aecfa6b4752967168efb880f231b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.0/stbox_4.22.0_linux_arm64.tar.gz"
      sha256 "a1a6b484f309ba458d0614aa18f5ea523173d1f493b9dc13d9bc1b09e1d5d0bd"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.0/stbox_4.22.0_linux_amd64.tar.gz"
      sha256 "9c52ccc2127bd29fb500dbb2485ccd7c8bb77b30e15bd2c60a2357e4a4854b8e"
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
