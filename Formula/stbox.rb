# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.26.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2384471d29069298dc4c40f7c39bd8c5c99500663cf0639153ae2e3fad19c050"
    sha256 cellar: :any_skip_relocation, ventura:      "edc43afa801566ceb2e23bc9e6df5937491c3cb0ab83ae21c61468bf893d2ce0"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "df028355f8ebc898b05ffcff9f0377a51eb95d22a81bac62aba5c15825753b45"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6c753a04918706dcead0b8248920aab2ec272ef7ca8ffdb3d7d143aae35295cf"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.1/stbox_4.26.1_darwin_arm64.tar.gz"
      sha256 "cf71be4240b4c80996901633c7e825e54a5519f94b2c85fa1364f96607e4fd08"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.1/stbox_4.26.1_darwin_amd64.tar.gz"
      sha256 "52e0fe71abe5f357449985eb90f5e1018df95d56d8739181b514c98070898674"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.1/stbox_4.26.1_linux_arm64.tar.gz"
      sha256 "4551d540b16d007c38b4335b15e7415490a42b48e7a0ec1f0715800ebcfbec04"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.1/stbox_4.26.1_linux_amd64.tar.gz"
      sha256 "c95e2ab7049ae7187917329fe6a9014bb2e47d57ada7b2350bd70092dd8581c6"
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
