class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.9/goneat_v0.5.9_darwin_amd64.tar.gz"
      sha256 "53dad7c5c76b13c974a31337d7d776719914298b3eda82cbbde34a0594090e1a"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.9/goneat_v0.5.9_darwin_arm64.tar.gz"
      sha256 "ed57ce49d8699a13a4f1bd38fd38b2fe1315e1f6493df7bdab16ad601a66f850"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.9/goneat_v0.5.9_linux_amd64.tar.gz"
      sha256 "52c9d40e8ef5ca4bc42bdafd5c121c46a506cd86c31e470bed6db96824c1ab37"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.9/goneat_v0.5.9_linux_arm64.tar.gz"
      sha256 "d50bc36a47d0cb7be54451c7642a395ba07edc14ba36316cc9c4e9c47fc44888"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
