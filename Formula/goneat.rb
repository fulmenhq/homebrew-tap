class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.0/goneat_v0.4.0_darwin_amd64.tar.gz"
      sha256 "625b570ad07db816c36e9944583a4e12acc2787f449105b1a0e01f992738809a"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.0/goneat_v0.4.0_darwin_arm64.tar.gz"
      sha256 "799741909854b87bcd42e80a732e11875f89f65b76501f2cce37630846a28cd5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.0/goneat_v0.4.0_linux_amd64.tar.gz"
      sha256 "0ffd36aebdd9ae5163db79a9d60644cb69d96d592396687c0f442fc00f8a099a"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.0/goneat_v0.4.0_linux_arm64.tar.gz"
      sha256 "6237b2ea531dbe41f3b1dbddad568c5f07613096734996c3dc6bca0463965b48"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
