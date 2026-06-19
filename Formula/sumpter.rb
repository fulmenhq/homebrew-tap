class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  version "0.2.0"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.0/sumpter-darwin-arm64"
      sha256 "1e65260e9265c87479dcd0dccae3793bac8f6d23ad7abe58ccfc25660b13580c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.0/sumpter-linux-amd64"
      sha256 "14250abd7ce6ed323f42416a47884cc6d515c06ab977e91cfd9f6cc948b6fbff"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.2.0/sumpter-linux-arm64"
      sha256 "54cd6b083d337c162a5dd0dff5f8ab9f399b3a7e7ff35cf39875c58555faa82c"
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
