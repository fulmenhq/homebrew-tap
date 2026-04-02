class Refbolt < Formula
  desc "CLI for archiving web documentation into date-versioned Markdown trees"
  homepage "https://github.com/fulmenhq/refbolt"
  version "0.0.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.2/refbolt-darwin-amd64"
      sha256 "97390bb2d564b8e2e19358cb6f8c76791ef7a21c9dfe871e9e9ebf32f97ad0ff"
    end

    on_arm do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.2/refbolt-darwin-arm64"
      sha256 "30fbdef226a0f8d209cf18ced902a93f5e9fc530124da8bebc5c145e2a79fc14"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.2/refbolt-linux-amd64"
      sha256 "7c7509b463c934c197b0d679c2c028fbe47d36accea518601ddaa8496744990d"
    end

    on_arm do
      url "https://github.com/fulmenhq/refbolt/releases/download/v0.0.2/refbolt-linux-arm64"
      sha256 "00f57dc53088a25b735b6b9795b24d5917805e9ed00e8512b668ae9ca88bb8a9"
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
