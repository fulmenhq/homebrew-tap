class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.14"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.14/goneat_v0.3.14_darwin_amd64.tar.gz"
      sha256 "25ed351c4733670548d6de5eb5d9d284565d45111dee0180787f9bbd7b5f0a9a"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.14/goneat_v0.3.14_darwin_arm64.tar.gz"
      sha256 "c5cbe99c559a3fb1c38b0b8a65780493131b64757db827be6786277d18e85620"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.14/goneat_v0.3.14_linux_amd64.tar.gz"
      sha256 "b9c0020824a344a92179a5130b8ce3b7aed516c9bfa054a1fb809d41176e7349"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.14/goneat_v0.3.14_linux_arm64.tar.gz"
      sha256 "07375fb31cb94b4821b7b3d08cb03529d1d1f12e4b40b371edd032ab56077442"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
