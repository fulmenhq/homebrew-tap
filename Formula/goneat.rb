class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.7/goneat_v0.3.7_darwin_amd64.tar.gz"
      sha256 "e89266493cda5161aeb44b0353ca9e0b20381d9a3b42d68d9aec2f64a1a080d0"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.7/goneat_v0.3.7_darwin_arm64.tar.gz"
      sha256 "7dd6aec7265174f6e8549290ad3ef481e3b83db825f6080b7d514eb1d5a62cd0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.7/goneat_v0.3.7_linux_amd64.tar.gz"
      sha256 "91d66d451323c03594bd579c775b50e323de5261c4eda14705d779e1439322a6"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.7/goneat_v0.3.7_linux_arm64.tar.gz"
      sha256 "2a4263fbe2f059272bc3f3591e36e88efebe5c1bff1b9182b7585712c9b27ab7"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
