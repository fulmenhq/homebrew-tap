class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.17"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.17/goneat_v0.3.17_darwin_amd64.tar.gz"
      sha256 "66f1669409d6a60ef0088f4c3f98f2b6fb7be35ad6a130aa16d65ff9f6cddeeb"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.17/goneat_v0.3.17_darwin_arm64.tar.gz"
      sha256 "05803af8044b6f0350786cfa173c3f9bb27e85becffdb9039eb7672433eb0547"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.17/goneat_v0.3.17_linux_amd64.tar.gz"
      sha256 "2de1a58820587190c45b30c22be400e2cd02cac2c7f425d679ede7e8c8710035"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.17/goneat_v0.3.17_linux_arm64.tar.gz"
      sha256 "72b62636648e6110f9dd773249d8a084ec67dc8ed2828856488061bdf9077c88"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
