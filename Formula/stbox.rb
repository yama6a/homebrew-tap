# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.24.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4288b521a44e3ece789aa1b8c747e735e8f8f8023865c5f373a59ce6edc8b70d"
    sha256 cellar: :any_skip_relocation, ventura:      "9a638749af1f0c7f75cd750ecc02b5734b4fcaa59ccf4d946d66bea8a465e002"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "b90b8e970495d47a2b1026c1175d402657aa2addb54a84881bba3d3b0c261330"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "194e07be6ed4c3c8a6590983d9feee4b787ac05f583c039d5f705f459d1e532f"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.3/stbox_4.24.3_darwin_arm64.tar.gz"
      sha256 "184bbf2f0c0bc4a68d8bf45a54f07d183cb1b87464c4ddfcb0a1ce889caf3bd4"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.3/stbox_4.24.3_darwin_amd64.tar.gz"
      sha256 "33f853fe988286a0f90e63810c75a5ce0b2c02a06037ebc965dd6b50ee1c81ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.3/stbox_4.24.3_linux_arm64.tar.gz"
      sha256 "cf3659605d2077d87edc039c9a236de930de6af81b28755dbe58bc36bcfa3c78"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.24.3/stbox_4.24.3_linux_amd64.tar.gz"
      sha256 "9bbcf1359fbb2b069ac079c88aa5f2fa0a3090d20ee782beefb3e03368951fa5"
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
