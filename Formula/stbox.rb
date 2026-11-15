# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.21.10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4c68bc6fe09abd2356540f12b9ed943d54f8753ff2dd1e471f05043a0e8608e0"
    sha256 cellar: :any_skip_relocation, ventura:      "af85d240d86801f3a925290edd7cce3e8c9c83b79de01f5d165bdb8e2696d776"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "634530f5ec103f7fdc1778587c75dd752dcc40974953558ff54989a405381f53"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2c8d9ad83a7bc6b02cce35f3a14e54dfc78b1b86f1ebe40baf5f49698f144a02"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.10/stbox_4.21.10_darwin_arm64.tar.gz"
      sha256 "8501cc4f05e0ba1bf789a8d48d87512d2da7e8fa76eff094477ac345c36e0037"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.10/stbox_4.21.10_darwin_amd64.tar.gz"
      sha256 "877ceaa7164b3c8539b5f79e535c89d18cbd474492fd5d983e45570adf22fafb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.10/stbox_4.21.10_linux_arm64.tar.gz"
      sha256 "e3f089a64b982058d08c1beba53f8b17730da602defba81bc1b9d33fd93a2954"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.10/stbox_4.21.10_linux_amd64.tar.gz"
      sha256 "64390e202f4ad3fdd487c67dc9f401171d580863954c3e068a995a58298dc714"
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
