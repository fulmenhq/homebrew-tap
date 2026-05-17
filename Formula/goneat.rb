class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.5.11"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.11/goneat_v0.5.11_darwin_amd64.tar.gz"
      sha256 "323ace007e7c4e6a1958b0c28e16f172936638573a3cd695eca888f7a5238818"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.11/goneat_v0.5.11_darwin_arm64.tar.gz"
      sha256 "ab0b04f94efee908ad40ca82b2b4bfb4329f7c33c61351c814da54a5c48c1f1a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.11/goneat_v0.5.11_linux_amd64.tar.gz"
      sha256 "f1ad7688718a2e90a937c60106084b11eb5621880a663c8114b7f3659638b17f"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.5.11/goneat_v0.5.11_linux_arm64.tar.gz"
      sha256 "91d89bd3e87cc65fb44a02fde9b3bced11d3856f9a24531f42fe3904b86c2f59"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
