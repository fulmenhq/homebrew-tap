class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.0/goneat_v0.5.0_darwin_amd64.tar.gz"
      sha256 "295259db2bfde77067dd04d93356f5b60df00233b39545c7c34bcf5f47858731"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.0/goneat_v0.5.0_darwin_arm64.tar.gz"
      sha256 "0497f6e0958a295b01ce53b332acbdc23dacb61a9a37915f22ea685518bdb4c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.0/goneat_v0.5.0_linux_amd64.tar.gz"
      sha256 "6a32e9dbb2595b9765888053a7c57562f3c56e54cc537886a867cba2e8b9b81c"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.0/goneat_v0.5.0_linux_arm64.tar.gz"
      sha256 "bac34200ba03d2b90d8dde9a6d512d8e20d1e7df7c7c6473f10e8b62e2f7c6ec"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
