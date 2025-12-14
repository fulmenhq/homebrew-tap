class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.20"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.20/goneat_v0.3.20_darwin_amd64.tar.gz"
      sha256 "a0f48b9dff52367d98e89e1d2a50dbaa22d2ffd9b5112d19b7b99f4ca084d6d4"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.20/goneat_v0.3.20_darwin_arm64.tar.gz"
      sha256 "51fe4114c40f80bd71013bea3fc1fd1950ddacee38a3bba222f14bd5d15b6439"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.20/goneat_v0.3.20_linux_amd64.tar.gz"
      sha256 "4775dbd70b2d2e811e0285e7d0d511ee4a73d42b55d6933c8f90a19284a21fb4"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.20/goneat_v0.3.20_linux_arm64.tar.gz"
      sha256 "3a4244579140f274e4c3089f83a4b5ed1af7bf8057acc9c977a91c8a2697cac8"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
