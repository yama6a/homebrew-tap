# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.22.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "467746d4e2e66902839302ea86721f2dd7eda87036b2c8975a5e5d6ccadd5e6e"
    sha256 cellar: :any_skip_relocation, ventura:      "fd44084618b4b1cc0bcffdbdb7c2cee7473dd4e86bc22d23f2b7cb9bb3108aa8"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "f3af0e12a6f1c1cc6f160f758693bfeacef5896259c35305880ca2086f55ed0c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "71ade49e5badd422d607d43182753286c21f2f180996b692f728ec52adb3bc8f"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.3/stbox_4.22.3_darwin_arm64.tar.gz"
      sha256 "2c9b93df804d298d156ae6ace6bfb0911b6e39e7d9c6f15aca78c5fd992854ba"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.3/stbox_4.22.3_darwin_amd64.tar.gz"
      sha256 "84e534939da10a461f9736dc104c126a6584c969ebbb175b3c14b961c7a9372e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.3/stbox_4.22.3_linux_arm64.tar.gz"
      sha256 "3b4ff2666d7b82143e7788b42cd4ccdc608d4296dcd965777ceeccb581ee9ee0"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.22.3/stbox_4.22.3_linux_amd64.tar.gz"
      sha256 "be1936156c3e5687190ea0adf465c855838a988b9077aa8462927ec2527f94d4"
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
