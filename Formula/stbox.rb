# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.23.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "210f9ca57c68b937cbd6425ae4905d437ba79fb1b41f6bd08896c134c1170b55"
    sha256 cellar: :any_skip_relocation, ventura:      "94dac8f188a68315755cdd6506c984723d155b49c11a74f813fd09c8f4c54ced"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "1457f9fe23b11e5c31d01a66419bf207de937c1d24b43ccf41689ade873fa6a9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "099aa0e265df8962055f9cf8523ed2017e7c61fde2840641f517e8551387e175"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.23.0/stbox_4.23.0_darwin_arm64.tar.gz"
      sha256 "c0a5d5f75568d7a04e852123b462b3c6a57f4eae3cb6f61784220e07d292df18"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.23.0/stbox_4.23.0_darwin_amd64.tar.gz"
      sha256 "2e45ba595fb13e51c3b02d4075a8c73118fc7f8e9736526123ab5665b83eceb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.23.0/stbox_4.23.0_linux_arm64.tar.gz"
      sha256 "276c98fcfc7be9415a304dfdcd824de74d498ede40f57f1b2ec5d57502d45424"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.23.0/stbox_4.23.0_linux_amd64.tar.gz"
      sha256 "b8eeb6613290255596549f033c47ca12b6a1e1152486a7aeb09237ba3122f8b6"
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
