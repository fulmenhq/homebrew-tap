class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.13"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.13/goneat_v0.5.13_darwin_amd64.tar.gz"
      sha256 "aaa54667b7fd6fb9a37cb384074e51211014e9d7b7ffa750fcdb191d81448ea5"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.13/goneat_v0.5.13_darwin_arm64.tar.gz"
      sha256 "244e23ae8019a991e2f260766d9214775a7b57e31bc416a9a7c5dee943bab50f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.13/goneat_v0.5.13_linux_amd64.tar.gz"
      sha256 "fe84817e4d97d97f755de5fcb695fdd8cf0cc5bb0cb510c34f4807c8aff7f6d9"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.13/goneat_v0.5.13_linux_arm64.tar.gz"
      sha256 "46b5b007a193570d504f391d2eb94e7829294b5587f2fa29db9f480486e46b93"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
