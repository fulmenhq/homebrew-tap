class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.24"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.24/goneat_v0.3.24_darwin_amd64.tar.gz"
      sha256 "b2c178c0452634ad4411290e7ec9c91650dc6040fc04bef6aec596a700c5e4fe"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.24/goneat_v0.3.24_darwin_arm64.tar.gz"
      sha256 "136523658df30cf1b63b7332d73edbcf98a18cdc47754d34000ac744cd620a27"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.24/goneat_v0.3.24_linux_amd64.tar.gz"
      sha256 "f25492e148cff847c0b216533ea01913fb3374b38064a5600dfdf52a93911d26"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.24/goneat_v0.3.24_linux_arm64.tar.gz"
      sha256 "5979e6d12d1a9eed69d57570b1b28d3cb34fb9a844c407c3ca461cdd6aced3d8"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
