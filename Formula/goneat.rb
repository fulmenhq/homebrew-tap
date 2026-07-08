class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.14"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.14/goneat_v0.5.14_darwin_amd64.tar.gz"
      sha256 "5e1d6cf329cfda43434171cbcdda38e049a75d4f48d9dc952504ce338175656a"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.14/goneat_v0.5.14_darwin_arm64.tar.gz"
      sha256 "bcfb2c44c216525a62325fe96636968b8518a7645e7b4cedfcdba7079314bd15"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.14/goneat_v0.5.14_linux_amd64.tar.gz"
      sha256 "a6a447053856d6853fae68b05c3f485d09d6f0dd971209087eccfda5d5a228c1"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.14/goneat_v0.5.14_linux_arm64.tar.gz"
      sha256 "916285f22585844817f7710faeefddf50049d23a9e8c28babdd8188200bc5d78"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
