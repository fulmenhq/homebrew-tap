class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.10"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.10/goneat_v0.5.10_darwin_amd64.tar.gz"
      sha256 "9c25693345dcdfdb2cf2b29eadd3eaf0dea7a208f3b92c63a2e135f754fac7e0"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.10/goneat_v0.5.10_darwin_arm64.tar.gz"
      sha256 "96475cf22e6a420c35bf27973ae97890775f5f14437a8a8570f74cdcf6339be0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.10/goneat_v0.5.10_linux_amd64.tar.gz"
      sha256 "df308fb114d3bc85fbd73fc594f792a5107bb08ec85dafb223a14c11c7296851"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.10/goneat_v0.5.10_linux_arm64.tar.gz"
      sha256 "43e9a49dbb84006aabbe08eb4896b1cdfc4ff02fefa9ec1a276d231d4d763066"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
