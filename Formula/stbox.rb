# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "becd494adca8a071e159258389178d1fb7a330363125590af00d336e92e2e6f4"
    sha256 cellar: :any_skip_relocation, ventura:      "9f194636b9c7d40ec27ef9a4169eeda6fc105a19c417d64157c14774bbfad0e2"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "32dd45047936485d41fbca9a0f895fd0448f1e005558050c7e56f02c2f94db78"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b49dee474b2dbdbc24944625134fdffe8fd975044f3347bd83adf61cd4c75428"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.2/stbox_5.1.2_darwin_arm64.tar.gz"
      sha256 "9700dcdf0b4607da207ae4f17e2cb872a8bd2513b6bd83b2178a9d29a81bd7a7"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.2/stbox_5.1.2_darwin_amd64.tar.gz"
      sha256 "26c3d8370910532201510f6d9f388aef91c10c5b941e77e0e24d62195f14ea34"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.2/stbox_5.1.2_linux_arm64.tar.gz"
      sha256 "6c99c8f0ab57ba9f73178995af8a7cadafddc7fb10de8c1ef215e77dd7323169"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.2/stbox_5.1.2_linux_amd64.tar.gz"
      sha256 "b0246ae0ed2277d65d63543c5206c58a1c38f981f17028cb3918a405f3b51d3a"
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
