# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6fde6303675b3d76e998708d688501108b22dd16a25458d744586da343745014"
    sha256 cellar: :any_skip_relocation, ventura:      "dbe1adce93eb81cd40d65fed478cea46778c08f0adb5ca70a0d24ebde6cbd280"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "8e99ac28a28d3ab96b0747dab86ca5bd3271616167868c920d7b53728cc8b3f7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cba7f81bb3ccf4ae7501f4eaa9935629a56d6bf298fa335c981dc46e143494e2"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.8/stbox_5.1.8_darwin_arm64.tar.gz"
      sha256 "805671a8eaddcbcd72f391b57bbe46178c4cfd499370f97fd7835e1194a712b2"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.8/stbox_5.1.8_darwin_amd64.tar.gz"
      sha256 "8906546e67a762fd333caf92849d7deed35f82979725a6b1a97452a6241bbf74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.8/stbox_5.1.8_linux_arm64.tar.gz"
      sha256 "f91559e391f5f75fb119775b650d766ac61fbca0f01b9ac3748b7007038dcf2a"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.8/stbox_5.1.8_linux_amd64.tar.gz"
      sha256 "3979f33f8b41cc3a61911adfe2fc856a7433329f0d81b53b83afa2bfa0f823a0"
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
