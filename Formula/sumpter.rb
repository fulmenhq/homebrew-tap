class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  version "0.1.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.1.10/sumpter-darwin-arm64"
      sha256 "fabefa26d9a14f44f87ce827b4957d5e0fd9df70d778d4b1173fb2e5b5013e6f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.1.10/sumpter-linux-amd64"
      sha256 "e571ab8adfbfede4b502a81c265964341754e49fe8fc0e70418a3c3b01566eb7"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.1.10/sumpter-linux-arm64"
      sha256 "5632f883f4a86ed2699f95f6d9f14293a549933d75074ecfb0be0773f461f4e5"
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
