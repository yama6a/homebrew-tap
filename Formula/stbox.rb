# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.25.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "967e014d0e3f79ff642aebd543d0b71bb68fe0dcea6dba0aefb29f41dc96cf46"
    sha256 cellar: :any_skip_relocation, ventura:      "671e0ba700a9521183b34056366fe926ffcfe550e70da14e0bd8c3c0d131862d"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "aa776f8b514c1d85149bc336bb2d880b8d6c9891553ee8897741af72bd524b8f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0c0ca2df51eab57f5e1910e472927544c4505004b55acd4ce3e186d03a156ccc"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.3/stbox_4.25.3_darwin_arm64.tar.gz"
      sha256 "07311d5454d3618becdc894120999e1c19074927620dcd4ec6e31ce8c1888200"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.3/stbox_4.25.3_darwin_amd64.tar.gz"
      sha256 "b5eb79438ef38efa6b67795f8899b5e2cd6f04190d1d5e38e4dacd9cb7360988"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.3/stbox_4.25.3_linux_arm64.tar.gz"
      sha256 "c6abfa5d9b44ec7e5df1a5bdf0a16b3e69411bd9441cadec6a9637ceecf0bc09"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.25.3/stbox_4.25.3_linux_amd64.tar.gz"
      sha256 "7fc68bef493b724befe472ac4e08536235f02e54f059e3e053e3a5b4aeced32c"
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
