class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.3/goneat_v0.5.3_darwin_amd64.tar.gz"
      sha256 "0ee76e0fb502100e0c9ac0a20699fbd0523345aa6da1cad681977a55540155f3"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.3/goneat_v0.5.3_darwin_arm64.tar.gz"
      sha256 "305025df6cbce4c97d00903f34ca8757ebf560a948659e375b9bd8d5c65e2bc2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.3/goneat_v0.5.3_linux_amd64.tar.gz"
      sha256 "5676a16851f466264fdb9d3f5468678c48933e74faddee98ad938bc832f8d3c1"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.3/goneat_v0.5.3_linux_arm64.tar.gz"
      sha256 "5a9b6398d3a192ebfd2c3f399f73c2dfe2d81382a3a9acc576321561738eae46"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
