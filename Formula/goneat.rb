class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.13"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.13/goneat_v0.3.13_darwin_amd64.tar.gz"
      sha256 "e91933b280a1b700d429e9f05aee255805b0705bc568d1b69f40ec1b8bee0ff4"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.13/goneat_v0.3.13_darwin_arm64.tar.gz"
      sha256 "87c8ba5a3e2b8e184c1d99ab2fb7372e93309a282ae6930dbbef92edd3aba615"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.13/goneat_v0.3.13_linux_amd64.tar.gz"
      sha256 "ec88d94c29013acb858fbc02837b02d5d6a73d620772b9192732d87551d2c44d"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.13/goneat_v0.3.13_linux_arm64.tar.gz"
      sha256 "52b5b593ade95b995562a9c995b4a85883cf2d9db3217b032aba68f6d77ef944"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
