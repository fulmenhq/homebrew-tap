class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.15/goneat_v0.5.15_darwin_amd64.tar.gz"
      sha256 "4642cad30d9c8fb1f973ad3a4d7ee9d59535b94673e9e6d13c6785f44a94451a"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.15/goneat_v0.5.15_darwin_arm64.tar.gz"
      sha256 "4aa29cf3fb72f6f73a339a8cd9801d8ee2c57aea78b82c1a10777f8e72d1c640"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.15/goneat_v0.5.15_linux_amd64.tar.gz"
      sha256 "888ca950c875336e3a572231db03447397b0a08dedfb780c11eb8c6766630dc6"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.15/goneat_v0.5.15_linux_arm64.tar.gz"
      sha256 "2046ee3d81a805db1c86137640b682cce4d8f6e9c4a8e2764136d35a8e7bae3b"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
