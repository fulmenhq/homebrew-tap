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
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.2/goneat_v0.6.2_darwin_arm64.tar.gz"
      sha256 "3c7d18acb4b46aca469dd2870009c392891fcbd014248817d0fd6acedb27aa93"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.2/goneat_v0.6.2_linux_amd64.tar.gz"
      sha256 "f9e29207cefecdfcbd2d10fc5faa9d25857689b786c8903ad09f31f9d2db8401"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.6.2/goneat_v0.6.2_linux_arm64.tar.gz"
      sha256 "0da47a7fabc6d47d24e3580c178a273374715b4e314b74756621ce4649fa00be"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
