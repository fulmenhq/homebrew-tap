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
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.4/sumpter-darwin-arm64"
      sha256 "19011533217905a3177539894f0e4b3426e4337a961cf3a6c88500d88a8b39a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.4/sumpter-linux-amd64"
      sha256 "ce55ffe786432992f52b4451604e18baa9b70a1d62d942ee944943928142bc78"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.4/sumpter-linux-arm64"
      sha256 "2b6c8719d04689e0df60b515903bb31eb61d02902831fb1e91744958a8395df3"
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
