class Dimlox < Formula
  desc "Moving and shaping structured data across the clouds"
  homepage "https://github.com/fulmenhq/dimlox"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/dimlox/releases/download/v0.1.2/dimlox-darwin-amd64"
      sha256 "072d476c9c94efc841fbbd5e8e0bdf712a5e9591abba9e612a51db9029d0db66"
    end

    on_arm do
      url "https://github.com/fulmenhq/dimlox/releases/download/v0.1.2/dimlox-darwin-arm64"
      sha256 "5a763b8b79d5194140726c8d4b4c0b1a611afe9a8a33add5615825db978c5e03"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/dimlox/releases/download/v0.1.2/dimlox-linux-amd64"
      sha256 "fd402a10e89eb7920432421c73b0c2e205b4179c6ff3da7ba7316267bd6029c5"
    end

    on_arm do
      url "https://github.com/fulmenhq/dimlox/releases/download/v0.1.2/dimlox-linux-arm64"
      sha256 "cbf961d21946f4ed25fad65b7e7c81f9284841a4a0355b07f4143d4492039573"
    end
  end

  def install
    binary = Dir["dimlox-*"].first || "dimlox"
    bin.install binary => "dimlox"
  end

  test do
    system bin/"dimlox", "version"
  end
end
