class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  version "0.2.4"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.4/sumpter-darwin-arm64"
      sha256 "640193b12d9df760a68d02f9ab5b2a1612597e36803ba4ae5c0558123aa1aeb5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.4/sumpter-linux-amd64"
      sha256 "dc7e1646bae9d4e2949863cb760a734b4e474d6330dd2e6bbc1e38d2d782b09b"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.4/sumpter-linux-arm64"
      sha256 "0b80a9a827e498544650bf5cd51a800a1130cdd1eb1801cfb2670f5c60e31830"
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
