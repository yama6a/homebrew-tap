# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-4.21.11"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1ab5b8985d7b7e0aa6ab5dc4b5f76c57c9160157fc3d091742ae14dbaad271b9"
    sha256 cellar: :any_skip_relocation, ventura:      "d8b58826ed2a6a54159a13caf899b535898b69a949382186301bdf6bf666cc98"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "ea89900c9dc6f62070ab818af243fb5b02550ff2d7ba4c483190414f30739328"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0dbfcaeb50b9e255101b8a1fdca78c7f33da9952d73c55d8de54d9feaa5fbfa7"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.11/stbox_4.21.11_darwin_arm64.tar.gz"
      sha256 "550e0cea8987ce7481b8cedbb1aea2bd81cbb5faa631e9d1d227a8b928ab3008"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.11/stbox_4.21.11_darwin_amd64.tar.gz"
      sha256 "43c72f4fec4f44e118824099f0059d80602c5432936fa4cc0d7cb5b727c54e45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.11/stbox_4.21.11_linux_arm64.tar.gz"
      sha256 "c15248ebb0e417abef5d6a915af71c270cc011736bbce38e1dec8ee3458df699"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v4.21.11/stbox_4.21.11_linux_amd64.tar.gz"
      sha256 "c8eaddcf6ee0d854917fb542fdf8e0ed4ebc5303f3701ef7b76fec2f009e88be"
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
