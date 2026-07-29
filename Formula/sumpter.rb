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
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.3/sumpter-darwin-arm64"
      sha256 "81800a5ebe05038ee29163e04ba88dac4ee8ab3333933983081d34bd2281e6c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.3/sumpter-linux-amd64"
      sha256 "fb68315633a36f0b57b73e5611effd77fa89758842fd20076b03a647add99366"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.3.3/sumpter-linux-arm64"
      sha256 "d768a6b70e4911f551f3e319278370001af36314eb242039c9d937d0d790a8b9"
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
