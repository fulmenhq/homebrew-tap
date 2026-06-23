class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  version "0.2.2"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.2/sumpter-darwin-arm64"
      sha256 "3c28a930578c6e69bf71ec73b22c8e304f9b743a874925128e811f2e9e148f6d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.2/sumpter-linux-amd64"
      sha256 "e7ae8b61022a1f7e7a735824d990c1476c7b4747cbde15feb037669727645135"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.2/sumpter-linux-arm64"
      sha256 "de00dd394c26a24c033e1457e4f06309a2e885988dbef1edbcfaf35b4b26bd50"
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
