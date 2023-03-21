# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "8.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v8.1.2/fastly_v8.1.2_darwin-arm64.tar.gz"
      sha256 "55cbc719c31fc93549100495de460376946f7a855f0c0479cf3a391757507785"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v8.1.2/fastly_v8.1.2_darwin-amd64.tar.gz"
      sha256 "9c88cbe5cc8e2ce8d9772f08def073174cb8853c22b7cf3d44d306f534993016"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v8.1.2/fastly_v8.1.2_linux-amd64.tar.gz"
      sha256 "2ee0ecc4ffad1f9e31a8cd4570332795c3f2fbfb2345ff2508e4546051d0f855"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fastly/cli/releases/download/v8.1.2/fastly_v8.1.2_linux-arm64.tar.gz"
      sha256 "783a7df5a621b2a8d0cd4ad163d49cd58282cc072bc3ea0fee2bc514bef7de7d"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
  end

  head do
    url "https://github.com/fastly/cli.git"
    depends_on "go"
  end

  test do
    help_text = shell_output("#{bin}/fastly --help")
    assert_includes help_text, "Usage:"
  end
end
