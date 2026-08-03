class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.16/goneat_v0.5.16_darwin_amd64.tar.gz"
      sha256 "da3a7a6c90279bfbbdd0421818e1417d8530e85f610ba76f916ee1252af83050"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.16/goneat_v0.5.16_darwin_arm64.tar.gz"
      sha256 "f5c67dcc4a88ae1506ee7fd67b147972b7449250a0cab9345199799ba73a20ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.16/goneat_v0.5.16_linux_amd64.tar.gz"
      sha256 "c876a550730a99e203ea83231c9beae55d90e3c75bab184f6e795b82bb246c36"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.16/goneat_v0.5.16_linux_arm64.tar.gz"
      sha256 "0cafea9f91f1bcaa4eb7610159f35657f5dda8248c2d678b1c28d57ed88d468f"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
