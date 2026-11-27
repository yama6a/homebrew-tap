# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c02324c6cf362719fcd65700b1d1b43d76b684a9b40880dbb1363c50be426182"
    sha256 cellar: :any_skip_relocation, ventura:      "b9e25d1d071baaf5d70e2c60d437f90c862d664439a5834d8711e780882ca65f"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "e95182fa3a6a77c22c2427461ee9c6a945b0d968c6f4d0d57667afb78922d794"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2bea90a96207a5d900f0376e87db79ce37f7ed6ec398c95c6bc1dbe9aaa18a89"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.9/stbox_5.1.9_darwin_arm64.tar.gz"
      sha256 "33e3912f7729bb315254ee485ce8a991304e9f4a913e402db746988b59efe8c0"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.9/stbox_5.1.9_darwin_amd64.tar.gz"
      sha256 "ddde9c6493a77576272a491ae98af98ebdf51a9d93868ba02d21421dab227c69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.9/stbox_5.1.9_linux_arm64.tar.gz"
      sha256 "a796a18b3965515f85c5f358cb07586cf47690c5366033de7b2b6bbbadd1aeed"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.9/stbox_5.1.9_linux_amd64.tar.gz"
      sha256 "6bc06bcedbd96b01908d9204800985d39bd6525de660912a753f17d0b7e4444b"
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
