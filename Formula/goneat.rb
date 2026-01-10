class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.4.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.4/goneat_v0.4.4_darwin_amd64.tar.gz"
      sha256 "f719ce7437dd6761e74707d78ccbb4b7233edcecc56d41e3c15d0d87c27b3be3"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.4/goneat_v0.4.4_darwin_arm64.tar.gz"
      sha256 "33eee660545f744e0c2e163da142c804bf5dafe25c4b4fd7cf46e86a6f4506d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.4/goneat_v0.4.4_linux_amd64.tar.gz"
      sha256 "1cdd502f42e28c1125d39ffa041d9c9e6fb5560e047c82983b704f0622f88062"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.4/goneat_v0.4.4_linux_arm64.tar.gz"
      sha256 "113ad6d8f71edc824c6aa12fd174766b619be4f3fb79d740214800a077753f7d"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
