# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "Fastly CLI"
  homepage "https://github.com/fastly/cli"
  version "0.25.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/fastly/cli/releases/download/v0.25.1/fastly_v0.25.1_darwin-amd64.tar.gz"
    sha256 "f7e3bfa01558594241062f11b568f0d788b15871e61637fecde17998f32e6377"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/fastly/cli/releases/download/v0.25.1/fastly_v0.25.1_linux-amd64.tar.gz"
    sha256 "3b136812910a6d68c0453d2e09f9738e021932d20928c87befaa40e2d0beaee9"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/fastly/cli/releases/download/v0.25.1/fastly_v0.25.1_linux-arm64.tar.gz"
    sha256 "08bc606c78bf45ebf2583d3137f5e7daae550c50cb4d8e0c739900f8e4d756f4"
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
