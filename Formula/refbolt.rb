class Refbolt < Formula
  desc "CLI for archiving web documentation into date-versioned Markdown trees"
  homepage "https://github.com/fulmenhq/refbolt"
  version "0.0.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.3/refbolt-darwin-amd64"
      sha256 "dfbf6486ad58bae71631bd1cb457cd05214e436c3d0ce2b63a71cb9e79dfb44f"
    end

    on_arm do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.3/refbolt-darwin-arm64"
      sha256 "a0cee15001f79717fda984c0af09a24123e2b8df79d9dae16b9103e6dcb0525d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.3/refbolt-linux-amd64"
      sha256 "50734fa95622babfb8b4c33616ba7a57bd8316b8147d11afa865226e1288ffd8"
    end

    on_arm do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.3/refbolt-linux-arm64"
      sha256 "2c2974c7b06782f443bc1c9ebc761ca45a28ac1903da1f81736b5f364d3d97de"
    end
  end

  def install
    binary = Dir["refbolt-*"].first || "refbolt"
    bin.install binary => "refbolt"
  end

  test do
    system bin/"refbolt", "version"
  end
end
