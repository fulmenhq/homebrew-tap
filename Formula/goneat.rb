class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.19"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.19/goneat_v0.3.19_darwin_amd64.tar.gz"
      sha256 "026ddec36e3d1254b53c666e849f30165c844f7cc079c32525f34a48c4c2b570"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.19/goneat_v0.3.19_darwin_arm64.tar.gz"
      sha256 "37c679d6cc081c2a1ac8ed6b764467003edde270ed756a691cd1427fdc4617c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.19/goneat_v0.3.19_linux_amd64.tar.gz"
      sha256 "32d450565ace8416431f6dcc14a51a325720e4dec30a1fab267a0b7384a86808"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.19/goneat_v0.3.19_linux_arm64.tar.gz"
      sha256 "da2ed12c9798dced3d5e830dc8fa940cea5764d075373fd1ece3ebdc2f26d670"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
