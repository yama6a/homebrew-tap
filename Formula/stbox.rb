# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "0e22abd890a3386b2975d9298610309631eb79034f966bce5fbf248ffdb9d0a6"
    sha256 cellar: :any_skip_relocation, ventura:      "3bad6855d731181072a9d592607be484b5bd4cb1054c84ac505435543d50d300"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "684ab52a3039d73cb310b0478aec7c10ff77c49179ad9ee8dbee87dceb65c305"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ffac661eb1eac5c5064f04421f840f046fa726a44fd5b371cf061a89290f9b65"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.7/stbox_5.1.7_darwin_arm64.tar.gz"
      sha256 "ba887f9b071c1864b944034a899d44f1faa82377a05ff9c43f3aee77e5ef1976"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.7/stbox_5.1.7_darwin_amd64.tar.gz"
      sha256 "e3d1ac23c422169ee3c63ef245beafbbe7353b232986224c633e3e49af7ef0ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.7/stbox_5.1.7_linux_arm64.tar.gz"
      sha256 "c41a0bb4f35247b0d1952f96d62c22b001d3c6bd8c5b1aa5bfe2efc20a547721"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.7/stbox_5.1.7_linux_amd64.tar.gz"
      sha256 "7050fd4ed97cfc91536832377a9461e897e7b05313932f1fc2be4035592ac323"
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
