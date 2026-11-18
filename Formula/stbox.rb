# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.26.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "cdb23e56bf38d8c20da73dd6e9ad6a51334119903a0ad7106346caf125105e2f"
    sha256 cellar: :any_skip_relocation, ventura:      "9b7b810c6595860e064857f8b1c37ff79b0d617e88d46466d9a3ccdc231e1787"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "5c9e551d8528b3819be2bf955ddcc951005d7ace9b9fe487a13b39a27aef03c5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "06f8f61ff8d7a0576c4239f9a1ac3f482031d7e1a6c38aeb9347df2e55f8a894"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.2/stbox_4.26.2_darwin_arm64.tar.gz"
      sha256 "c6d37af3049027ff701b46e148871c5c915550e37374514e912e9855100452fd"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.2/stbox_4.26.2_darwin_amd64.tar.gz"
      sha256 "d8f3a88729b74c704d0454e9c97e6f5ae54ac8bafd456cc74505d403315dd4ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.2/stbox_4.26.2_linux_arm64.tar.gz"
      sha256 "fba428cedafd4f0ce6bd907e000f4c4dc05028b7decba1f91ed229580748ffcd"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.26.2/stbox_4.26.2_linux_amd64.tar.gz"
      sha256 "481fdc6638ed010c7a5b9c7f4693ea5da613c333bae719be639cf43d9f10ad76"
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
