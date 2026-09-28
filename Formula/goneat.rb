class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.1/goneat_v0.6.1_darwin_amd64.tar.gz"
      sha256 "1003787fe4f8e038c72a953f0ce23ebd2e08d9bdb7295ea2353ad30635e7574e"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.1/goneat_v0.6.1_darwin_arm64.tar.gz"
      sha256 "db607726853776256de865b119366ba5056b9d1d7bb1e2fb56ca9eae9c6c9d6f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.1/goneat_v0.6.1_linux_amd64.tar.gz"
      sha256 "5bbc963134fa5925ed4250d07692777885d61d55ce3cad8d01d9336bb0c1e205"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.1/goneat_v0.6.1_linux_arm64.tar.gz"
      sha256 "b3f0a7400b2980781e38152771db64424e66f4b7a143d389e153adcc05bc825e"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
