class Dimlox < Formula
  desc "Moving and shaping structured data across the clouds"
  homepage "https://github.com/fulmenhq/dimlox"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/dimlox/releases/download/v0.1.1/dimlox-darwin-amd64"
      sha256 "a23345db8e9cd28abf2860b1710d69762d24526044a3724c4df22733b6f7fd95"
    end

    on_arm do
      url "https://github.com/fulmenhq/dimlox/releases/download/v0.1.1/dimlox-darwin-arm64"
      sha256 "133670f27f2aa33ba9bd095345d5af920887fb76f7cbcedbd891bafe04c4bd06"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/dimlox/releases/download/v0.1.1/dimlox-linux-amd64"
      sha256 "ab2530d5fca71730fba4f01793e54342f99ff7f933721abcb9546c4e5a59acde"
    end

    on_arm do
      url "https://github.com/fulmenhq/dimlox/releases/download/v0.1.1/dimlox-linux-arm64"
      sha256 "326f638d3d8798f337d039a763c32d46404a4bfd71bad7adf1cdb986b8da0a47"
    end
  end

  def install
    binary = Dir["dimlox-*"].first || "dimlox"
    bin.install binary => "dimlox"
  end

  test do
    system bin/"dimlox", "version"
  end
end
