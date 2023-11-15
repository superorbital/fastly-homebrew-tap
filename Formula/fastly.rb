# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "10.6.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v10.6.4/fastly_v10.6.4_darwin-arm64.tar.gz"
      sha256 "3f2fe8c998703c2d03176703eced20c19abfad7692985a8e5f143aaa771f3992"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v10.6.4/fastly_v10.6.4_darwin-amd64.tar.gz"
      sha256 "a16a713a31547dddecea327b765a1f988a0c2ee9ce942507916f1e373e3d8299"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fastly/cli/releases/download/v10.6.4/fastly_v10.6.4_linux-arm64.tar.gz"
      sha256 "ce1082d5d020b05c3ac1f8a7c880c070d3a889d508e73b3666f0c1c997fdc489"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v10.6.4/fastly_v10.6.4_linux-amd64.tar.gz"
      sha256 "63c3269896a5086a5bc4ec6a4930a66d9e9414216fd2d83bebf9139f31963175"

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
