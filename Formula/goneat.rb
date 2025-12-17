class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.21"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.21/goneat_v0.3.21_darwin_amd64.tar.gz"
      sha256 "33422adb2c62eb6ab695867d021695931624c8ca1b8e64d7938207ece020c051"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.21/goneat_v0.3.21_darwin_arm64.tar.gz"
      sha256 "801ba2bb736cdbbe6358312af57963fe0f3ba7af0ec77de8ed60ea632f7a377e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.21/goneat_v0.3.21_linux_amd64.tar.gz"
      sha256 "cb55c607ca42d424d21561d23bf707dbda86d9db2eb6131094e9e9b750d0e8ab"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.21/goneat_v0.3.21_linux_arm64.tar.gz"
      sha256 "75b42da4abf060283fe2b8cbe655d667de467e65cef9efce4f27910efbe5ad5b"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
