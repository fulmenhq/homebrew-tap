class Limensafe < Formula
  desc "Confidential Context Leakage (CCL) detector for repos and workflows"
  homepage "https://github.com/fulmenhq/limensafe"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/limensafe/releases/download/v0.2.0/limensafe-darwin-amd64"
      sha256 "05faee948647635e47dd7e5c418d231a130e805a6bd8b9255b0eede9d5cee41a"
    end

    on_arm do
      url "https://github.com/fulmenhq/limensafe/releases/download/v0.2.0/limensafe-darwin-arm64"
      sha256 "6f61a7cfba249d461c87ec8d45171b10968febad853d0cb2344ff79ab6ef1ac0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/limensafe/releases/download/v0.2.0/limensafe-linux-amd64"
      sha256 "39e76cb14504837327cb0246a06f8fd6cfd2617bad777785fbe4424d32c81a42"
    end

    on_arm do
      url "https://github.com/fulmenhq/limensafe/releases/download/v0.2.0/limensafe-linux-arm64"
      sha256 "110f085802eedbddc260680df833069d825e13f6efb1f7fe2581d0c4e85799c0"
    end
  end

  def install
    # Release assets are bare, platform-named binaries (not archives);
    # install whichever one was downloaded as `limensafe`.
    bin.install Dir["limensafe-*"].first => "limensafe"
  end

  test do
    assert_match "limensafe", shell_output("#{bin}/limensafe version")
  end
end
