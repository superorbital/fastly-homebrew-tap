# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "Fastly CLI"
  homepage "https://github.com/fastly/cli"
  version "0.21.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/fastly/cli/releases/download/v0.21.2/fastly_v0.21.2_darwin-amd64.tar.gz"
    sha256 "6c2b714fb07233c7329e6e5fe5d4c1839cd30909e28aa98ca3ab4ec6e27e378b"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v0.21.2/fastly_v0.21.2_linux-amd64.tar.gz"
      sha256 "14ebe153120e2decbd67e236d29aced0be09318098ce757c52aa541754747127"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/fastly/cli/releases/download/v0.21.2/fastly_v0.21.2_linux-arm64.tar.gz"
        sha256 "e16b62b4fc04af37f0333d9049e9e8437642e52a565f60ca6fb214f5e46d63f4"
      else
      end
    end
  end
  
  head do
    url "https://github.com/fastly/cli.git"
    depends_on "go"
  end

  def install
    system "make" if build.head?
    bin.install "fastly"
    (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
    (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
  end

  test do
    help_text = shell_output("#{bin}/fastly --help")
    assert_includes help_text, "Usage:"
  end
end
