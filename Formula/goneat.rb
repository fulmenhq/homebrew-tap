class Goneat < Formula
  desc "Go developer tool for neat code and smooth workflows"
  homepage "https://github.com/fulmenhq/goneat"
  version "0.3.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.5/goneat_v0.3.5_darwin_amd64.tar.gz"
      sha256 "ceda853023a8450b22c48e3e05b8e0b7c3b0c827eca414c5ba999cbd58bc4bf3"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.5/goneat_v0.3.5_darwin_arm64.tar.gz"
      sha256 "c4bb9a5f1b9721a2b6be43b945ac0fa56e6face2d9d6e9a3957cca5259149bfa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.5/goneat_v0.3.5_linux_amd64.tar.gz"
      sha256 "bc146fa475d684cd42219d06d73db73cbf00ea3779a7e1c10addf5e29d4e5236"
    end

    on_arm do
      url "https://github.com/fulmenhq/goneat/releases/download/v0.3.5/goneat_v0.3.5_linux_arm64.tar.gz"
      sha256 "ef078be3f5861954c13bad0cac78f8937bce95a7ab333ce5c4cbf3262b0379de"
    end
  end

  def install
    bin.install "goneat"
  end

  test do
    system bin/"goneat", "--version"
  end
end
