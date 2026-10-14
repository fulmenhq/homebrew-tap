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
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.4/goneat_v0.6.4_darwin_arm64.tar.gz"
      sha256 "65c4e890f754d7f07a5de5b5f6594dc8aac06cd05be0be02306b5b3e4907ce92"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.4/goneat_v0.6.4_linux_amd64.tar.gz"
      sha256 "f426bae8ff3b1e0d2b1ba0c0698cf7d4390badad86f171fc9763e8c3ed3fb60f"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.4/goneat_v0.6.4_linux_arm64.tar.gz"
      sha256 "a04c63197f6eb177d8f49847cd00a687f9f01b7e2db9a49f154ede2e8b615c1d"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
