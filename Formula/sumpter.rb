class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  version "0.2.3"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.3/sumpter-darwin-arm64"
      sha256 "ee8431f19de82ec5e9c3152b48c8b873a65215b48ce12fc0a4775831cd531509"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.3/sumpter-linux-amd64"
      sha256 "0e5007de74661e18ad4fb7a1f0feac8c903a8f6c94faae83f55f3325d20bd04c"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.3/sumpter-linux-arm64"
      sha256 "ee328c3be79e706d99e007c8eebb0f18c1d9a833f04e53faaf80c2140bf9bfe2"
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
