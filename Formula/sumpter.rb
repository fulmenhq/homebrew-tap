class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  version "0.2.6"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.6/sumpter-darwin-arm64"
      sha256 "724e48d7b5a40fc8f7a6a7918b99ea11b045cd5e15d600cb52b6a63d04d71f02"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.6/sumpter-linux-amd64"
      sha256 "13c59bd89741e796a1b6f18c9ede929a09ab59479cc1de8e92afa393ab8a833d"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.6/sumpter-linux-arm64"
      sha256 "58dbb772ad804777c33d85e560fea1ece8270a02e9a60a1d55c10d3b5298b276"
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
