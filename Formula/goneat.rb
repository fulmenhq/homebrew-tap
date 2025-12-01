class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.8/goneat_v0.3.8_darwin_amd64.tar.gz"
      sha256 "7dda6a091a154e33b79858fce4fb67a9226190252ec087604945c76d90faca81"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.8/goneat_v0.3.8_darwin_arm64.tar.gz"
      sha256 "b37b9acbc0eec1f311ef41382dc6a0e14bda3aa78387872bfbbdce2850829745"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.8/goneat_v0.3.8_linux_amd64.tar.gz"
      sha256 "6f7ec5c983bfffedc83038185d00a2457790d788b1d4251cb9fa657f54976e9a"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.8/goneat_v0.3.8_linux_arm64.tar.gz"
      sha256 "26326efba2d6cf4d93938b16e25a12cd0a15d8a26f6d4bb6ce486b1d336e1be7"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
