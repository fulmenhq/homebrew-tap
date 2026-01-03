class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.2/goneat_v0.4.2_darwin_amd64.tar.gz"
      sha256 "6efa8836ef23c28406a2948ffb450b4f53b0b96c93ada08022386ac1a5da4c80"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.2/goneat_v0.4.2_darwin_arm64.tar.gz"
      sha256 "695eceeb6dbf685c770e660b0b3f75b2bed18a7b53c13130bfde09e0d60198c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.2/goneat_v0.4.2_linux_amd64.tar.gz"
      sha256 "c1296c4f7ad9cce0b2a413365b5671814e6244ce7f0a477c65bf5fa69c5a52d1"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.2/goneat_v0.4.2_linux_arm64.tar.gz"
      sha256 "1aa1659556116298e621a20a27351bd5fe62f67bc011ae1ebd1cf5024c8e09fb"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
