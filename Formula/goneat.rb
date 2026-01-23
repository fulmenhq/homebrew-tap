class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.2/goneat_v0.5.2_darwin_amd64.tar.gz"
      sha256 "ee06fb5ae4bbe052d576eed49b4ea338742bce767958ca24d5a3fdbf273352a0"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.2/goneat_v0.5.2_darwin_arm64.tar.gz"
      sha256 "5974f5c9dc403a4e6f1ec6e7bd74350c165a4bc55c138fd682ba829a4fccdec8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.2/goneat_v0.5.2_linux_amd64.tar.gz"
      sha256 "2738de369e2b69265fbfdf62a89c9f2958175495e57dc6f6bd7b314c497c6f55"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.2/goneat_v0.5.2_linux_arm64.tar.gz"
      sha256 "e73357a42cfe134d4332bd68ec2f22c70f9b15c02700a2fbf597a0d33e1e5c64"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
