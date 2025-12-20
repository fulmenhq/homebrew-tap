class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.22"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.22/goneat_v0.3.22_darwin_amd64.tar.gz"
      sha256 "cf66d1a65934df17907a4fde751bdea1e0ec59b8c3ea0146e3268d5e30eba063"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.22/goneat_v0.3.22_darwin_arm64.tar.gz"
      sha256 "0598bdbc0e8f4fbb4bfd6c62a1f9259e33d08ca4b1d933cda472e799d7f981e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.22/goneat_v0.3.22_linux_amd64.tar.gz"
      sha256 "0ed86a531f856d6c5aae4fe011ce686c0b0f24eeecc2a119127454d809e9f235"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.22/goneat_v0.3.22_linux_arm64.tar.gz"
      sha256 "7decf3286a572dc2970c50800e4293ce7800107e6d3ca29188a280c21a7fd689"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
