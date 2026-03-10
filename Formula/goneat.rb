class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.7/goneat_v0.5.7_darwin_amd64.tar.gz"
      sha256 "e1fc5f52aa8d89d47fb921fafd2cff2c2eefcf690927d04f249e963e933ee087"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.7/goneat_v0.5.7_darwin_arm64.tar.gz"
      sha256 "b0e6d79fdb3996f77f1bfdf97ea2a7e06aecd839f1fa14f4e4a0da7202e78aef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.7/goneat_v0.5.7_linux_amd64.tar.gz"
      sha256 "b6d032e6cef41a193cad20c2462247f0e3db141ea7477f273a8c48bdbb653118"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.7/goneat_v0.5.7_linux_arm64.tar.gz"
      sha256 "50ded0fa2c65c6cecac0c008266f51f0d4676eac3d29cc880de6a327ac85df9f"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
