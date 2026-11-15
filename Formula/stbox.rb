# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.22.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "970cb750b8d2b847840bbf04460a71b1b541f3485d5faebc474c66b68a52b592"
    sha256 cellar: :any_skip_relocation, ventura:      "9abfe52939deba3002504b5a05c6bcd698c4f116454009f3b725f9bf0e6cb6d8"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "5976ace0f01c684c680f77047239d0698fc0c7c2387faf249ce24b4629901198"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f0bfad903d8058d9f18d1ee768fafd34d200fa2be938a4d19523468fd33ff1ae"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.2/stbox_4.22.2_darwin_arm64.tar.gz"
      sha256 "3f85616e0f2db56a4033c425a4f7dfa26c9cb0cb55557889c3b69ade75674c11"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.2/stbox_4.22.2_darwin_amd64.tar.gz"
      sha256 "1fceb34fb7461e1828e1de6848dcb29291e2d82621d9311a50053a881c84405c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.2/stbox_4.22.2_linux_arm64.tar.gz"
      sha256 "7a379367be7f37ca10def9e472795a42aad3f21be6015a8d72b7ae5479b9bed4"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.2/stbox_4.22.2_linux_amd64.tar.gz"
      sha256 "3950ef3c427ee05d6621cb84c237fa2e53b5f53dd900e56fcb350200d6d375cb"
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
