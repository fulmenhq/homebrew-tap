class Sumpter < Formula
  desc "Streaming XML extraction engine for large, variant-heavy inputs"
  homepage "https://github.com/fulmenhq/sumpter"
  license "Apache-2.0"

  # No darwin-amd64 binary as of v0.1.10 (Intel Mac retired). The head spec
  # gives unsupported platforms a buildable fallback and keeps
  # `brew readall --os=all --arch=all` valid tap-wide.
  head "https://github.com/fulmenhq/sumpter.git", branch: "main"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.4.0/sumpter-darwin-arm64"
      sha256 "d9b625eaef073f80b4150010d1c469a4f78337f1fc67793f65a846a03d76c94d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.4.0/sumpter-linux-amd64"
      sha256 "df2bdb550b5f59a1222e30dc6d7e1544da9370dfb28a5cf5124534884c65083b"
    end

    on_arm do
      url "https://github.com/fulmenhq/sumpter/releases/download/v0.4.0/sumpter-linux-arm64"
      sha256 "ad27e194780357b447b7267e1a9df3dd5a23e61d7eb809e838bc55543bd0a21c"
    end
  end

  def install
    binary = Dir["sumpter-*"].first || "sumpter"
    bin.install binary => "sumpter"
  end

  test do
    system bin/"sumpter", "version"
  end
end
