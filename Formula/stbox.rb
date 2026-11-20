# Written by .build/homebrew-formula.sh in yama6a/subtitle-toolbox-go on each release.
class Stbox < Formula
  desc "Read, edit and write subtitle files"
  homepage "https://github.com/yama6a/subtitle-toolbox-go"
  license "MIT"

  bottle do
    root_url "https://github.com/yama6a/homebrew-tap/releases/download/stbox-5.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "947631311ec8cbe518591114846c118b506218479c7bd2e69ff26bf8e945b86c"
    sha256 cellar: :any_skip_relocation, ventura:      "0f1d5fb5040eda283b09cec74397e0322c9d224869a87a8cd17eaebc823a7b87"
    sha256 cellar: :any_skip_relocation, arm64_linux:  "4268818ebb1c8b47b939a3af70600d57c94e37be3421da870f3614e87791f67c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "500f4f283302e84034d4a978f72601f7872af26b145a7cd92f52e962dd3cef62"
  end

  on_macos do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.3/stbox_5.1.3_darwin_arm64.tar.gz"
      sha256 "8b1717dbf508726ced0dbc4a239d52d5fe9bdcdb4574df19e522a8d41dc9c541"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.3/stbox_5.1.3_darwin_amd64.tar.gz"
      sha256 "fc57c1eb6fe9497c0c262c85162ee1e88510c11be62f9db97a2759540e093b5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.3/stbox_5.1.3_linux_arm64.tar.gz"
      sha256 "9cfb0f003989240689b7c124537764a6d4fc2cd0342a3435bf839c863e035dfe"
    end
    on_intel do
      url "https://github.com/yama6a/subtitle-toolbox-go/releases/download/v5.1.3/stbox_5.1.3_linux_amd64.tar.gz"
      sha256 "e9419db7b78451d7c176f263b3209681114ae128b747b083aaad1539b215493c"
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
