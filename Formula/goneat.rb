class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.4.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.5/goneat_v0.4.5_darwin_amd64.tar.gz"
      sha256 "8db053c6d3fa261788110be9f86311fac057538335f9f8fdb0b294c399010e81"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.5/goneat_v0.4.5_darwin_arm64.tar.gz"
      sha256 "1b31588864ab32fcb9f4964132919af216eae26f3d3668af77eff1dd67fe3471"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.5/goneat_v0.4.5_linux_amd64.tar.gz"
      sha256 "a023a76da95ac4e3c25a62f756b5d5d1f20c30ac76ccdccf023524461fcbb8cc"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.5/goneat_v0.4.5_linux_arm64.tar.gz"
      sha256 "a6d5e38dc3bd1f0172f868239ce2804dbcdcaca02b7d50725b534ffcd80b7346"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
