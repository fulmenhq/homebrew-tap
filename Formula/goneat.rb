class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.12"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.12/goneat_v0.3.12_darwin_amd64.tar.gz"
      sha256 "1ca7d7d5f413e448da54b71044a8ebbb3158a83f15e8a8fd13f68f95d211429d"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.12/goneat_v0.3.12_darwin_arm64.tar.gz"
      sha256 "0b6a1adac608a642c16ee776c05328834eb624934e18e2003c05a6d9a39d02cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.12/goneat_v0.3.12_linux_amd64.tar.gz"
      sha256 "3bdf376f3afd5f0c44142a3367a02bf23cb24955be2de5467dd06302d39ca71a"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.12/goneat_v0.3.12_linux_arm64.tar.gz"
      sha256 "2ed061322c3d2c79bc28d9f11dc11c4159d4ddd57064bd41c627ba2e3fa7fa93"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
