# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.24.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d52ce6f901a7b6569db1627bf5380f868b3fa937477ac9c0727bcbc0a2cd87f8"
    sha256 cellar: :any_skip_relocation, ventura:      "fa2f9a843e7a1c349030b63346e47ad4938b9ea412e286b56f6a653eab22462b"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "f6a78182f0f7260182152c2d177eb6c2e2c196e8cbb55259e6d41285a0fe9100"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c87910d507b87a7649787e384d6901baae7784892580de1db1eb513f5b6399b7"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.1/stbox_4.24.1_darwin_arm64.tar.gz"
      sha256 "c49c0339b5b0f97b5223e00df812b4616cb427b74558f2be0d16eaa8a82c54e4"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.1/stbox_4.24.1_darwin_amd64.tar.gz"
      sha256 "3724b16d02561e3cc44f97c8231371924075b0fd41783fca9980b14f316c635f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.1/stbox_4.24.1_linux_arm64.tar.gz"
      sha256 "e8de2c9a7d835dd97fa17eedf1fb690d8446693fb61de679316352ec663d2589"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.1/stbox_4.24.1_linux_amd64.tar.gz"
      sha256 "71f413ce3d4f404e92f85d3dbcaadd5984076dabb4bad52d1afb3f0993720600"
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
