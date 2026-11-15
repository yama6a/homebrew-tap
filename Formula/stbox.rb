# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.25.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5eb32f3cf4632053e1ba64589bf8ac97dedc6c800282ccdeac078e5e4ac381c2"
    sha256 cellar: :any_skip_relocation, ventura:      "5104ebc2611b772da7e211079857bc817f7575de9922bf47095db7e061e726e6"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "09f2ded57b477e15c9e6ba003e9763df622474ba34f4c33b62c7a51c3cffff2f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4b6480cedf228158291bee81a8acd81faa192193fa702c3b9a6e33ba428daacb"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.5/stbox_4.25.5_darwin_arm64.tar.gz"
      sha256 "be25ef70abe99726c450ca6f0aa876d77de4619afb16665ec58f1f4e549e3bbf"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.5/stbox_4.25.5_darwin_amd64.tar.gz"
      sha256 "0fe6bb595503f6ee714c9b91ab8a6223f983a7c3f5ceede3d642a09ea771ab38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.5/stbox_4.25.5_linux_arm64.tar.gz"
      sha256 "a37190c8a29474aa80d943be62b412a1272ab6acfb60d3d278e44ab51f4dbb2a"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.5/stbox_4.25.5_linux_amd64.tar.gz"
      sha256 "59d55fd9b15bd718d7b22f003f3846f35ff037763a2b8df21f868087426899fb"
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
