class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.1/goneat_v0.5.1_darwin_amd64.tar.gz"
      sha256 "fa16f1c9d77e1c8ebe6baa4ec138ff520bba47f1104b2c853da632cf3d694a46"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.1/goneat_v0.5.1_darwin_arm64.tar.gz"
      sha256 "9c0d203871822321a6f8afea82b4b9e5b94dd776857d7ca3b8d5f566d407ff1e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.1/goneat_v0.5.1_linux_amd64.tar.gz"
      sha256 "8ba31f7a00ac07af5e324c961c7027a396c9d488a5da8ace9df340f3aef28225"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.1/goneat_v0.5.1_linux_arm64.tar.gz"
      sha256 "2ab1ac96942b228fbc057ab94d4cd89bbb6b0f31cdf7a7078055dbe6fd75afc4"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
