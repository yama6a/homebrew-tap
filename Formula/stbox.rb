# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e4b40fdea0c50c18cc0358aa18035a418fb21560c9a9989665f5e2e20f6a82dd"
    sha256 cellar: :any_skip_relocation, ventura:      "09e615abc9c0fd53bc19bfe7d47fbdaa4191c6eadf6e9012b65e8b8b6f77f63b"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "a557e623f31f708111db643274899610f40a9da4e5609a1a2a5d966e233981a8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2fc82c963a945d1bc68cc8b0fb9e74b7f3cf7474b13b7e09486a84a232bf1987"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.5/stbox_5.1.5_darwin_arm64.tar.gz"
      sha256 "60615cf7a555b2d67871fa07d626cd638b3007b57711813083ac2fbf5c6df1d7"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.5/stbox_5.1.5_darwin_amd64.tar.gz"
      sha256 "5f5d39d1813dc2de8f542092d77c74a6d58acda7718f5d8067ab5cf5ff48e375"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.5/stbox_5.1.5_linux_arm64.tar.gz"
      sha256 "67e3231971d28b0aee8c5e7316df2295ec1865e7fde98c6bedf0511d71e731ae"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.5/stbox_5.1.5_linux_amd64.tar.gz"
      sha256 "e8990fde2828cc9a69ab993bba61db7a4127faccb5c93e12d0386ff5c5dbc077"
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
