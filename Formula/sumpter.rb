class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  version "0.3.0"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.0/sumpter-darwin-arm64"
      sha256 "5489640038579e106cbf3427a8a8672f77da85a6ca3f3256da7725fd0fb7b7bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.0/sumpter-linux-amd64"
      sha256 "0e1b4e1dea9f989f960fd6edc0fc1eb6033026bf9ef40b8b0d075909fd7d9b60"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.0/sumpter-linux-arm64"
      sha256 "34a6b00a40ff5b4255c8b339654dc58458233e4f2647fdd49998b1fa61103dba"
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
