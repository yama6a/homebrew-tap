# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.22.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9e9e5c65c2130db8a7056cf8b11bd5fafebb5b90a404dc330abff05242d4be51"
    sha256 cellar: :any_skip_relocation, ventura:      "671835ab3c34efed5af87ff50dfa3268f68ab7eb542cebfbcb5407428384f319"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "f60d6dbb583e12790fc4e946e5c2a539be3be27341451c4b09b048a650c2c642"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6d112021d7341f5b7fd49ffbb1e3864b483166cc8aefdb0c8c2dd3bd598218fe"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.6/stbox_4.22.6_darwin_arm64.tar.gz"
      sha256 "402f8ae83e1a42c3759e477a016631bbe9c8b0a45fe06b74d817be851d520274"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.6/stbox_4.22.6_darwin_amd64.tar.gz"
      sha256 "a69dae7db33101bd7561c38c92c3b77cd272ecd42d41297e9f6772c6b3052477"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.6/stbox_4.22.6_linux_arm64.tar.gz"
      sha256 "26d56f827af348863c01ed94b29726a6660b55a73d6c01961668fa206baa9bf8"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.6/stbox_4.22.6_linux_amd64.tar.gz"
      sha256 "9e7e0657490eb8a5ac53422f873ede29e5f51a01d8b4c65137ec48cb3819b25c"
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
