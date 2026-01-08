class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.4.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.3/goneat_v0.4.3_darwin_amd64.tar.gz"
      sha256 "ccb628a589310d8c8084bb41bc149b19b906839f8015b8967572c920b8763bd7"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.3/goneat_v0.4.3_darwin_arm64.tar.gz"
      sha256 "d7f7ad75ce4c839ff45b8f61ad4088f8b43613cf7951430e4d5e46b7a8a7a0b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.3/goneat_v0.4.3_linux_amd64.tar.gz"
      sha256 "2861b7ed78fd067e7085e9373340bb4300c8b204cc1e10820cc1652927d788b5"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.3/goneat_v0.4.3_linux_arm64.tar.gz"
      sha256 "863901e8efa2e3fd913d3b39a7294835e534f0307980074adf91d1e957d4e93d"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
