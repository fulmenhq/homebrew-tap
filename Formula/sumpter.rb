class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  version "0.3.2"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.2/sumpter-darwin-arm64"
      sha256 "26cce0cbe246275ea7de21edf64194cdf08f488600baaae1b8ed7ac25f6b5a94"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.2/sumpter-linux-amd64"
      sha256 "e8b86cb9f428eff218a8533da3c9f9633f22608af3a924e295bbb1c5644efaa1"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.2/sumpter-linux-arm64"
      sha256 "23c3fcb6fb949deac9f04da0daf2f80c86375addecba9eb04057c74024dd437b"
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
