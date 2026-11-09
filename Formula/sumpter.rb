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
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.4.2/sumpter-darwin-arm64"
      sha256 "bd1c8897ac6b178b22260a997e782810ab8b7618bd1c2e79d797680eb1f478fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.4.2/sumpter-linux-amd64"
      sha256 "d2ccd78768ad9d77e6ef14bf49b19296c646ae520829b8091da0f2c598d3aee5"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.4.2/sumpter-linux-arm64"
      sha256 "3fba3e5b3a9e64c16c14cfda84a4afc7f71b4319c25b597cc8fc9485671d6e76"
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
