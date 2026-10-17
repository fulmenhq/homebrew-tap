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
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.5/goneat_v0.6.5_darwin_arm64.tar.gz"
      sha256 "44be12d52717244c4328b60f9d74973e75d1ff0762ed561cf3297ed9c859bcaf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.5/goneat_v0.6.5_linux_amd64.tar.gz"
      sha256 "974de9a090c489a9a2def389175a3a29e21cea879cdcb3a9249a776fedab8571"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.5/goneat_v0.6.5_linux_arm64.tar.gz"
      sha256 "a15ed79d46b5dd543041fd16317764a28f40efe7d702f9d0d6d43979b74343da"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
