class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  version "0.3.1"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.1/sumpter-darwin-arm64"
      sha256 "4a6e131ef5de415b436d2732d548d3438681aeb5ff00579eed50d3f83e68ba71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.1/sumpter-linux-amd64"
      sha256 "a9edeba8b97db0eccec974a2ce8cff61dade402e5eaf3d3f262ef73c710d72fb"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.1/sumpter-linux-arm64"
      sha256 "3e457368697eabb354c790f7ae18180e9248f14356875884fa54066d71dbab9f"
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
