class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.1/goneat_v0.4.1_darwin_amd64.tar.gz"
      sha256 "c38f700dc0eab00cc76ab27590cc513993194d5ec9d2f679b9ece794a041811b"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.1/goneat_v0.4.1_darwin_arm64.tar.gz"
      sha256 "b9756e4c5aae5db27a2b211f66bcfabb4c3eb4ddd4a46be6d92430b7bb7d1ffa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.1/goneat_v0.4.1_linux_amd64.tar.gz"
      sha256 "b08697aa6fc293aa36e247359bc5720df846d68aeb11a56c45494c06221268ed"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.4.1/goneat_v0.4.1_linux_arm64.tar.gz"
      sha256 "f7d5e187de034c7c80266d5be1b907288b131ebd992cd2bc1fb515cd438852b4"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
