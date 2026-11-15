# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.26.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b91038c769db05fa37632aee1d2dbb751986813cc578ab9b924e9ff9945c8244"
    sha256 cellar: :any_skip_relocation, ventura:      "532aa5b3bcc7689f39295e007bc624629026771024d54d9b71bf183545944e35"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "afc3013dc9a20171279b15a6b5a683c80fe9225444b7716fc611c5fe8f2e3b6a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c991cd519a4e0637ef7d6e9cb7fee8c1b3e3ae6a82cfd438cf97c26e64cdd635"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.0/stbox_4.26.0_darwin_arm64.tar.gz"
      sha256 "5314493f72578be6b543c93949928bbc98689e147368887ddcd39d001c5d4332"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.0/stbox_4.26.0_darwin_amd64.tar.gz"
      sha256 "59f1145c19c6058032d1eac2fccb1bd19cd03bca7e73acf02a92a433bda52072"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.0/stbox_4.26.0_linux_arm64.tar.gz"
      sha256 "a72f632e1b3b20c666df12b767640e81dc719fd540f34c24af76dd5909696d3b"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.0/stbox_4.26.0_linux_amd64.tar.gz"
      sha256 "add53e27e8e0927dd69af61521a6d94c519275aa15dfc1ef74c31a5283db9283"
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
