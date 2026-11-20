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
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.9/goneat_v0.6.9_darwin_arm64.tar.gz"
      sha256 "ab929c33c94c060e1f7a2e1d8a6b0ee6f6a88f81c83c9bb5834b05eb33985813"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.9/goneat_v0.6.9_linux_amd64.tar.gz"
      sha256 "a7b5fa84130fdf39a110fc25d37429abe292a58426ed776aaaec38b0ac0fbe46"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.9/goneat_v0.6.9_linux_arm64.tar.gz"
      sha256 "c488d78088473f7f918ad98017d9b64085dfc46170ec34bfc41e6aa7b8baec85"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
