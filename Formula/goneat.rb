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
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.3/goneat_v0.6.3_darwin_arm64.tar.gz"
      sha256 "429c9e7fd8a9f415e0dbab1178625fd97dcc160671e50a109c6f4d97cd143188"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.3/goneat_v0.6.3_linux_amd64.tar.gz"
      sha256 "1b4bd77cfcc9aad5a7fbe1ec6799029ac2e058e1bbfe1ee4bf89c61e889a3e14"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.3/goneat_v0.6.3_linux_arm64.tar.gz"
      sha256 "ca74e54e72f5c25abaa4dee346444e27526558c032e5e4c9f5a1dfe7b5076dc8"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
