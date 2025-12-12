class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.15"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.15/goneat_v0.3.15_darwin_amd64.tar.gz"
      sha256 "83fdb039c2adc38e52253a98d474dccdb6f754a800a91d92f0cc7d6148a95870"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.15/goneat_v0.3.15_darwin_arm64.tar.gz"
      sha256 "0ffa5840b55768f8ed89d6e325eb5c946ea28948aa9bba9a737a23c8e9e7749c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.15/goneat_v0.3.15_linux_amd64.tar.gz"
      sha256 "d223555894b549f3070d5631575fc90e10bdfdb1030825bafe84df92e00a4f9f"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.15/goneat_v0.3.15_linux_arm64.tar.gz"
      sha256 "547407d131b94c0971a96ba014aafcfd90cf3c91e73a45f73e90f585524378df"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
