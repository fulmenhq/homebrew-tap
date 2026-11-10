class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  license "MIT"

  # No darwin-amd64 archive. The head spec gives unsupported platforms a
  # buildable fallback and keeps `brew readall --os=all --arch=all` valid.
  head "https://github.com/fulmenhq/goneat.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.8/goneat_v0.6.8_darwin_arm64.tar.gz"
      sha256 "6e37ca3cd3146f324ebfb4fe08d47bc9b26a00c6657814f67ab2f93d6cc0c811"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.8/goneat_v0.6.8_linux_amd64.tar.gz"
      sha256 "105259d5d6bbd7e24f096f39f54c1ac7638d5cab884e2cec5fe4f05295ac3d34"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.8/goneat_v0.6.8_linux_arm64.tar.gz"
      sha256 "ddfc46881935248d06292ffa4ccd26e3ac3b4a891102f43760906d7834a381fe"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
