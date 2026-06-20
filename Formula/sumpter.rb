class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  version "0.2.1"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.1/sumpter-darwin-arm64"
      sha256 "0c8480467617545b60d2b8bc2d3400bb1b8626775a58f974ea8f09e44312e555"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.1/sumpter-linux-amd64"
      sha256 "ef86251b291c364f720c7dc10fa386b2d6f0ae6e498925b3dd829615d18dc4f5"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.1/sumpter-linux-arm64"
      sha256 "36201c0085f570f0c6166c47822533a6225f487f7a9f01d2a4c89aa991b516a8"
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
