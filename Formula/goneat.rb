class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.25"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.25/goneat_v0.3.25_darwin_amd64.tar.gz"
      sha256 "04c6c915879cc539f41ba40c42b5661bfc2289cb6e208246bef6d65abb7b4540"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.25/goneat_v0.3.25_darwin_arm64.tar.gz"
      sha256 "f405d8a8b161070f7f3b7aee46e96b77d3ba2d18e323e844e8d339017f7f6a75"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.25/goneat_v0.3.25_linux_amd64.tar.gz"
      sha256 "73dcbcc451e7b7135a1a311dcef456635cab92c8cdeeb168fa688ba13eadd429"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.25/goneat_v0.3.25_linux_arm64.tar.gz"
      sha256 "d3d036c536161e843fde62da7d1a0856401d4111d0be97a7c94088879f4400dc"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
