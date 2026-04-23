class Refbolt < Formula
  desc "CLI for archiving web documentation into date-versioned Markdown trees"
  homepage "https://github.com/fulmenhq/refbolt"
  version "0.0.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.4/refbolt-darwin-amd64"
      sha256 "9f56d3af0f11db23216585f25e03f5a793ad9b80047c8168822c12bbd035bf01"
    end

    on_arm do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.4/refbolt-darwin-arm64"
      sha256 "78d234ee0109bffb8e026e3e256bc8163bfe43219be7132051b412aba0e893d2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.4/refbolt-linux-amd64"
      sha256 "cedb58604346803981fcfb3c2bee8eec83cb8cb7c7b2e85b4e6db4c60cc9fd4e"
    end

    on_arm do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.4/refbolt-linux-arm64"
      sha256 "bc8f287849efd546ee665a25d3b5aeeed6bcd62605c2a60effd9d5951504a410"
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
