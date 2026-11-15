# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.22.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9b36b22a8910b27ebf3acd08f306d327948fef20e3d9d084bf5e1250efff172b"
    sha256 cellar: :any_skip_relocation, ventura:      "da1315ab6fea142f51bdabffd2a66e3506c4bed52be57b3816becce06c8bcea1"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "7c9ca82a0fe293057954eef5b19d865f259425d41ca364c6ee83db7c71d18bb6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6fb27ea3421fbcc801d242f6646829473977dd05cab5106852eab7e43f5681be"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.1/stbox_4.22.1_darwin_arm64.tar.gz"
      sha256 "bc03eb4b8df29fcf9f1af98a1b47dd868e72c60d21817c846600b5c255daab01"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.1/stbox_4.22.1_darwin_amd64.tar.gz"
      sha256 "fa23476fe0767f0ac5c2437410a0d7303232044058b78641e7d3127fbfe5d4b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.1/stbox_4.22.1_linux_arm64.tar.gz"
      sha256 "4f100c5a9e9ad57d6f7973ea807471d2e13e3ca55e8ebc7d5b1f4243638199d7"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.1/stbox_4.22.1_linux_amd64.tar.gz"
      sha256 "33ebe8a006aa4c62d80c92f46e6d484964aa3cb40ed5dedf929f68c8713fed62"
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
