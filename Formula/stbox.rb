# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.22.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a02d5fafad94df39f8e34064559c79de0f6a94722848a49c3f89fd4f780819bb"
    sha256 cellar: :any_skip_relocation, ventura:      "e808dda4f186c96e9216df178cf8014697e07931a2ed7a9ae7ba19416507d83a"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "a6b3775defc23571132c4efdb1f674afb7cd37f40a4c3e963683171e3063a020"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5d350f5ce695f4039ab1a9dfca8f5f3fcd804cb84a33706d9532fe87e393ad3e"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.4/stbox_4.22.4_darwin_arm64.tar.gz"
      sha256 "20d934d3af08b5d91aeaf7064468b2afab27a35aa0a91a6dc095022cde9f698d"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.4/stbox_4.22.4_darwin_amd64.tar.gz"
      sha256 "4660d9b664258455e96d4c4f3641b8b516e95563398aadaa9b2292fce2631f0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.4/stbox_4.22.4_linux_arm64.tar.gz"
      sha256 "4dbe8d1f805df5ef6d44fb83694186f55c232817f93394b91ac777c0e38c35de"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.4/stbox_4.22.4_linux_amd64.tar.gz"
      sha256 "c701ae4d26f9b33dab529cd2e5f37e4bda66e377221751cdaa71e457d6cd4fd6"
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
