class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  license "MIT"

  # No darwin-amd64 archive. The head spec gives unsupported platforms a
  # buildable fallback and keeps `brew readall --os=all --arch=all` valid.
  head "https://github.com/fulmenhq/goneat.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.6/goneat_v0.6.6_darwin_arm64.tar.gz"
      sha256 "7f4afeaf297ef9a47e9e850e934d2ca9a020274ddd323bfa9c6d62b62aa6d18a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.6/goneat_v0.6.6_linux_amd64.tar.gz"
      sha256 "4319d262c5bf06a663620b1dc10c5862546cf48228913b56f48ca88328a0f458"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.6/goneat_v0.6.6_linux_arm64.tar.gz"
      sha256 "ecdc7fce09efde379ec95724198eb2392ef1437fd8425db1ac62b3450482595a"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
