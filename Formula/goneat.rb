class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.18"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.18/goneat_v0.3.18_darwin_amd64.tar.gz"
      sha256 "1866eb4050edb15e0de066841dfcc63cbd91c10a2d5627943642317a9781f2da"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.18/goneat_v0.3.18_darwin_arm64.tar.gz"
      sha256 "c34f4c60f9876339e752d74664a11aa8f29bedb8ea7a65e6b3b423164ebaf6e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.18/goneat_v0.3.18_linux_amd64.tar.gz"
      sha256 "24dba432aa7b200369db5f7ea32b1de48942549c28538a7ec15c8345313530ac"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.18/goneat_v0.3.18_linux_arm64.tar.gz"
      sha256 "66362c43710abe60449e69579de8fef9f7544bece6fc71aa2dce6f4af197682d"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
