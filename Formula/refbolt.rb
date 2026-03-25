class Refbolt < Formula
  desc "CLI for archiving web documentation into date-versioned Markdown trees"
  homepage "https://github.com/fulmenhq/refbolt"
  version "0.0.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.1/refbolt-darwin-amd64"
      sha256 "0ae9a35d6d36123ec8bb14e991492ff719388f3d0b46c3cca4905e0af2e21797"
    end

    on_arm do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.1/refbolt-darwin-arm64"
      sha256 "22160bb9c871a90b34626a9728fd41357bec030a50ea5eeb38855d24ef219d98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.1/refbolt-linux-amd64"
      sha256 "a999a353c532260c524994cb57b9ce7d53ad4b30661ef8e6ba3aab1564631edd"
    end

    on_arm do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.1/refbolt-linux-arm64"
      sha256 "9e372d2e1b2f163b49edd90de38182d4bc94b9f211eed82ebe887a489cb330ac"
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
