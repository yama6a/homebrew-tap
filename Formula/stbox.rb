# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.26.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4f0ab6aaf4c621ab647a023b3e3825a0200b1fae4c7d877262e5af69b6eb51b8"
    sha256 cellar: :any_skip_relocation, ventura:      "962b8cb44035b5fd8e9d062982ee620ee4fa371ef5d0611e55495eb9475fcae2"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "6b4e785c0e9ba98a9d95c9a03c2e10556e4032182b109cf59cb84351930a0b7b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0fb6fdf4390e5a64c8667a78839aeb3db1b8a9c91db547bde14fa293402caf6f"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.3/stbox_4.26.3_darwin_arm64.tar.gz"
      sha256 "855d2eb58f6dfbc8f521b0fdc12e50ca22a52bdd08c8a2789be0171f0fccdb06"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.3/stbox_4.26.3_darwin_amd64.tar.gz"
      sha256 "b82d5e773e643746c9b918176b6501dad0ecce7dc4ca4108b8266ab4ce4edea0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.3/stbox_4.26.3_linux_arm64.tar.gz"
      sha256 "086806bd3eb968b7ee773c9fd068affb23710b80e7ad5c837331af732c2731ae"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.3/stbox_4.26.3_linux_amd64.tar.gz"
      sha256 "2faf506aba20063eaec292d17c5531afb9ef5fef6bf69872b6f1c858f7dc0202"
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
