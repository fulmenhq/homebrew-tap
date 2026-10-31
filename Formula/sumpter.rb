class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.4.1/sumpter-darwin-arm64"
      sha256 "b12941b33d5bccc7d7ead551ae653dcc23d1a56aed095783f5ff541ed477b6ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.4.1/sumpter-linux-amd64"
      sha256 "67317e4129f1a2e420a7380481e12686ea3a9e134721374c9e831776c46e169c"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.4.1/sumpter-linux-arm64"
      sha256 "1998815e9e74981cd1523255d7b44f2a3553220945682e0bee80c6655303ad41"
    end
  end

  def install
    binary = Dir["sumpter-*"].first || "sumpter"
    bin.install binary => "sumpter"
  end

  test do
    system bin/"sumpter", "version"
  end
end
