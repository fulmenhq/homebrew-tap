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
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.5/sumpter-darwin-arm64"
      sha256 "ac8f5defd04af2fb52643c6df5e85eabcbfcf3f5f667b324c4eb05c398119e14"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.5/sumpter-linux-amd64"
      sha256 "db7e59f02940c56416246a1d3ebf8cf49dac107d28d73e0f71418bfc8b3ca2c2"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.5/sumpter-linux-arm64"
      sha256 "9e8979c422ee31f3b57a09cd6aa2698dbd00549a655eb173d0b32611d0edbe45"
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
