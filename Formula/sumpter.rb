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
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.6/sumpter-darwin-arm64"
      sha256 "feb0a43884b8bfa157a1c58b52f62b0d22ce0951d413b70ee3175775db175eee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.6/sumpter-linux-amd64"
      sha256 "0ef2da7c3e8e296b6ac0b80cbdd9ebacdf5151c933ca3973d3420693e2f60998"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.6/sumpter-linux-arm64"
      sha256 "400fac8e4a14fa7cb5b0dd6fe1320a6bd32a2ba791cb12a8187c30842d51fb9f"
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
