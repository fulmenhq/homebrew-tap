class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.0/goneat_v0.6.0_darwin_amd64.tar.gz"
      sha256 "25820283dab3583d6d2d3673b8ede4879b78bddd612f10b6b746f6273fe8e5d0"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.0/goneat_v0.6.0_darwin_arm64.tar.gz"
      sha256 "4c84db2268fa3ef4d27fd4b0ffe0c80d3fd9fb0222451cdc986ca8f1e27baf06"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.0/goneat_v0.6.0_linux_amd64.tar.gz"
      sha256 "00ad61ffdbb1cfe3f6602fb0fa06e928a337a192a1393630bcc5122cff8a86f4"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.0/goneat_v0.6.0_linux_arm64.tar.gz"
      sha256 "77c322b0d90a58c485069e3f47b8cca143a8055bbc9fcddb1ffb6bd1be003742"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
