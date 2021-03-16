# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "Fastly CLI"
  homepage "https://github.com/fastly/cli"
  version "0.25.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/fastly/cli/releases/download/v0.25.2/fastly_v0.25.2_darwin-amd64.tar.gz"
    sha256 "468d53fef3534a4f63963ff1ca455286d92445d231fe4126d1321546665b92f4"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/fastly/cli/releases/download/v0.25.2/fastly_v0.25.2_linux-amd64.tar.gz"
    sha256 "53ab12d96803865108f0d42a8991b4b83b81764ba26d5b6635d5424376a00091"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/fastly/cli/releases/download/v0.25.2/fastly_v0.25.2_linux-arm64.tar.gz"
    sha256 "21c327eb9f04f414285185a67ead7bd1333de9d57c12ee21e005b4de865df384"
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
