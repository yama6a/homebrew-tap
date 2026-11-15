# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.22.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9085d1319d4b2ff1d87b14c4dbafeb69d09ab104be2bca33a7710ec0b9327566"
    sha256 cellar: :any_skip_relocation, ventura:      "f577c23d608a0d2e170e1bfb08f399f74b47da64802e8d9fb152a0e09e32dcaa"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "3172eb7fdc798bc77811d419a7d7a7f5f62753aba9fb16612d665b346de00ed5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "721f6ed17d9ba11cfcaccfab458ebc58c000dbef5da507f7b2c56a7ffad1cf51"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.5/stbox_4.22.5_darwin_arm64.tar.gz"
      sha256 "e380c25ea0216bdb2aadcb9f6a39e488ba23431f076ae889e0fe73b5ab789ee9"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.5/stbox_4.22.5_darwin_amd64.tar.gz"
      sha256 "2db8ac816bcade746115d276bf563549fd762168e7ecff2c0f4e4fc12f7c6aca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.5/stbox_4.22.5_linux_arm64.tar.gz"
      sha256 "ad80e32f6669a0896599cb78b68783f766a7ad02e6cf1f749d425159c2b397ee"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.5/stbox_4.22.5_linux_amd64.tar.gz"
      sha256 "f2e2e4d24d9cc9b089dc2c87ffc578d481cf27f7d3d7c03c5378877641f66743"
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
