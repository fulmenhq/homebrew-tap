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
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.7/goneat_v0.6.7_darwin_arm64.tar.gz"
      sha256 "e6834c6a8c589503e956804d791cc6a503f720af87e761df1f8a314b2d85a90a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.7/goneat_v0.6.7_linux_amd64.tar.gz"
      sha256 "f4985b3036c947d0f575e0d4bbb2b0902796796702225a85bf866eaccf053b75"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.7/goneat_v0.6.7_linux_arm64.tar.gz"
      sha256 "1c25cdf8b4c6a6e745a83a48f51e812914c9e856a2bb783a3a5870d2142beb40"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
