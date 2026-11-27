# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ffdb320f73034e54798a6e1d12544ffaf7a3932cc551d0728b1b86a6399d7fff"
    sha256 cellar: :any_skip_relocation, ventura:      "a4604e6ccb4b7066c12f72abc9eba04eadf84ba9d315d5886496832872719fac"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "7e4b4d4f6ab07e0cb50b526c68fbb354ad9a7cdc8e78c5789d3829bb0c5a4428"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e3f29b9747424a569cb6300039804f0ac33f1af310b98f89d28cecc07b321fc1"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.10/stbox_5.1.10_darwin_arm64.tar.gz"
      sha256 "1ee349e275bd263e8e7ff3d2236394dfeb1a5663186e1a263d81d1cb3c31c7de"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.10/stbox_5.1.10_darwin_amd64.tar.gz"
      sha256 "d172f0c3ea380a768ec7f563a6972c722db5ad99204945be74b3e53f612014ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.10/stbox_5.1.10_linux_arm64.tar.gz"
      sha256 "e4391d2ce030ebd930012a610ec451b9b504a4bc2f7d546410e1ae67397c637d"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.10/stbox_5.1.10_linux_amd64.tar.gz"
      sha256 "c92426789c6c6c6ad66912eee52610884231c0e9facd6f5cfb50be0237aa0773"
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
