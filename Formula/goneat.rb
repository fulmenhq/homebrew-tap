class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.4/goneat_v0.5.4_darwin_amd64.tar.gz"
      sha256 "5fff0fd14998246a99c23ca7663ec40138deeb693c7dd0c58c0180992b37c9a5"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.4/goneat_v0.5.4_darwin_arm64.tar.gz"
      sha256 "11e1303f09b5a220667c23aa15a6a6c1d569151041917aaec5da2296f34e366a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.4/goneat_v0.5.4_linux_amd64.tar.gz"
      sha256 "56e8a6a15773b63a82128b6d7407d44f5e56db375e3727540d81e2eceae52052"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.4/goneat_v0.5.4_linux_arm64.tar.gz"
      sha256 "345c533a08d268ffead20353de9955bd0cf12b4a3cd93b9718b446d7ce66639e"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
