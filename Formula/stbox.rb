# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.24.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "dda7460823d4d04e1696a7daede33f15fa571346437b974e04cfea599cd74184"
    sha256 cellar: :any_skip_relocation, ventura:      "747bd41126dec411513d4b23b4955335314f406d40163f06f568ae56abcd9e5b"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "2be508a156e7113ef3a1e70cdcc94bc9474960f0cf63989734c9f62b073a91b5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e56ef1a451cc5b337cf1b7480a48612f2a1d4aa558f9b425932c4d3806f78381"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.2/stbox_4.24.2_darwin_arm64.tar.gz"
      sha256 "343ecae7147eebd17cb9b87c88f235a6013b6d3fa69741cefb1598ee97970917"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.2/stbox_4.24.2_darwin_amd64.tar.gz"
      sha256 "6b23f1a6fb431fad6f6e610f0ff9a1f36f26642c32397b6000875333f4ffceb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.2/stbox_4.24.2_linux_arm64.tar.gz"
      sha256 "8c45ddb5d97f38fde1e24b709362326cfbfea91b3868481bab84ace347f8d4e0"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.2/stbox_4.24.2_linux_amd64.tar.gz"
      sha256 "f5e3a9b1d3391fe9b5cb9bb1098c59ecd98020337cdb8e84122e610c8d072d37"
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
