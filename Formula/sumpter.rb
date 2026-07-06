class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  version "0.2.5"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.5/sumpter-darwin-arm64"
      sha256 "17887bdb0c167a6b63fada3d6996392c8c859a5dd7bfdf01c65b01eb1dab8858"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.5/sumpter-linux-amd64"
      sha256 "742506c4ca1faa0d10ae6540c898ee62d951c0a5c2e9321e1a50ee1a8a91ebdb"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.5/sumpter-linux-arm64"
      sha256 "bfdf5538cf48e12e3144800ffa5dcfdff70a315f02cea90c3fc43ceccdbd0e9d"
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
