# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.25.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7dd636f08d163498c16202727d64c585db960526cf93b1c11339b20bbdf5c6c4"
    sha256 cellar: :any_skip_relocation, ventura:      "1f734aa986535ebbf16213b25412e60d476f36fb504a3b047675029c1ae8f5a9"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "eefa1f3155537ecf402357333f39eca29f79612bed3464373d1e6e60bfb791c3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7c6ae68d6ed1a85b4f03adc6238f2ec199c33c5641851b9b9514b00eb0f1567f"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.4/stbox_4.25.4_darwin_arm64.tar.gz"
      sha256 "f3975d39707e15f09f7389859e2270a2b7af695635e00647d99cff5748be3f98"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.4/stbox_4.25.4_darwin_amd64.tar.gz"
      sha256 "534d628d6df9b450c113aea4b17c28ffb8aeed39871accb1e8080c7fed4602ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.4/stbox_4.25.4_linux_arm64.tar.gz"
      sha256 "791f1f8d6a6333051826e2eb335b2555e3c23fba4934ba4bd7ad4e78f1270550"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.4/stbox_4.25.4_linux_amd64.tar.gz"
      sha256 "741d49906dbd28fcf8e190f952e01c7b8a81925b8ce545c5ca5c709c2987e479"
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
